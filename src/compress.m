% In this function we keep the first frame and then we store the difference
% between it and every other frame.

function compressed_Data = compress(vid_Frames)
    
    fprintf('Starting our Video compression\n');

    % first frame and then convert it to grayscale for comparison
    first_gray_frame = rgb2gray(vid_Frames(1).cdata);
    total_frames = length(vid_Frames);
    
    fprintf('Loading %d total frames for our compression.\n', total_frames);

    % we store the difference of each frame w.r.t first frame in this cell
    frame_difference = cell(1, total_frames - 1);

    % Computing differences compared to our first frame
    for i = 2:total_frames
        current_gray_frame = rgb2gray(vid_Frames(i).cdata);
        frame_difference{i - 1} = int16(current_gray_frame) - int16(first_gray_frame);
    end

    % Building our output struct
    compressed_Data.first_frame = first_gray_frame;
    compressed_Data.diffs = frame_difference;

    % for visual check showing 10th frame
    if total_frames > 10
        figure;
        imagesc(frame_difference{10});
        colormap gray;
        colorbar;
        title('Difference from frame #10 to frame #1');
        fprintf('Displaying as a sample difference frame (#10)\n');
    else
        fprintf('Not enough frames to show the 10th difference.\n');
    end

    % Obtaining information/sizes for our original and compressed version
    original_info = whos('vid_Frames');
    compressedInfo = whos('compressed_Data');
    
    original_size_MB = original_info.bytes / 1e6;
    compressed_size_MB = compressedInfo.bytes / 1e6;
    compression_ratio = original_size_MB / compressed_size_MB;

    fprintf('\nCompression completed\n');
    fprintf('  Original size: %.2f MB\n', original_size_MB);
    fprintf('  Compressed size: %.2f MB\n', compressed_size_MB);
    fprintf('  Ratio: %.2fx\n\n', compression_ratio);

end