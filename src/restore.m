% In this function we take compressed struct and reconstruct each frame
% by adding with our base frame

function recovered_frames = restore(compressedData)

    fprintf('Restoration process starts\n');

    % first frame (original in grayscale)
    base_frame = compressedData.first_frame;
    num_Frames_to_rebuild = length(compressedData.diffs);

    % allocate our first frame manually
    recovered_frames(1).cdata = base_frame; 

    % rebuilding each frame using stored differences
    for i = 1:num_Frames_to_rebuild
        % we add using int16 to avoid any underflow issues
        reconstructed = int16(base_frame) + compressedData.diffs{i};
        recovered_frames(i + 1).cdata = uint8(reconstructed); % back into uint8
    end

    fprintf('Restoring all our %d frames.\n', num_Frames_to_rebuild + 1);

    % Playing our rebuilt video
    try
        % we need to reshape to 4D because implay expects it this way
        fprintf('Previewing restored video\n');
        previewStack = cat(4, recovered_frames.cdata);  
        implay(previewStack);
    catch ME
        fprintf('Error during playback: %s\n', ME.message);
    end
end
