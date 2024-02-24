module transcript::transcript {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    const ENotIntendedAddress: u64 = 1;

    // regular Move struct
    struct Transcript {
        history: u8,
        math: u8,
        literature: u8,
    }

    // SUI object
    struct TranscriptObject has key {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    struct WrappableTranscript has key, store {
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }

    struct Folder has key {
        id: UID,
        transcript: WrappableTranscript,
        intended_address: address, // intended address is the address of the person who requested the transcript
    }

    
    public fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {
        let transcript_object = TranscriptObject {
            id: object::new(ctx),
            history,
            math,
            literature,
        };
        transfer::transfer(transcript_object, tx_context::sender(ctx))
    }

    // can view
    // can not update, delete
    public fun view_score(transcript_object: &TranscriptObject): u8 {
        transcript_object.literature
    }

    // can view, update
    // can not delete
    public fun update_score(transcript_object: &mut TranscriptObject, score: u8) {
        transcript_object.literature = score
    }    

    // can view, update, delete
    public fun delete_transcript(transcript_object: TranscriptObject) {
        let TranscriptObject {id, history: _ , math: _, literature : _} = transcript_object; // struct unpacking (destructure object)
        object::delete(id);
    }

    public fun request_trascript(transcript: WrappableTranscript, intended_address: address, ctx: &mut TxContext) {
        let folderObject = Folder {
            id: object::new(ctx),
            transcript,
            intended_address
        };
        transfer::transfer(folderObject, intended_address)
    }

    public fun unpack_wrapped_transcript(folder: Folder, ctx: &mut TxContext) {
        // Folder like an envelope, WrappableTranscript like a letter and the intended_address like the receiver so that only the intended receiver can open the envelope
        
        // Check that the person unpacking the transcript is the intended viewer
        assert!(folder.intended_address == tx_context::sender(ctx), ENotIntendedAddress);

        let Folder {
            id,
            intended_address: _,
            transcript,
        } = folder;
        transfer::transfer(transcript, tx_context::sender(ctx));

        object::delete(id);
    }
}