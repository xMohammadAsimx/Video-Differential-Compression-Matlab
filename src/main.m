% rgb4mpeg2mov function
[mov, info] = rgb4mpeg2mov('./akiyo_cif.y4m');

% To compress the original video
compressed_video = compress(mov);

% To reconstruct it back from the compressed form
restoredVideo = restore(compressed_video);

% Check to verify same frames back
fprintf('\nStarting restoration check\n');

maxPixelError = 0;

% Loop in every frame
for frameIdx = 1:length(mov)
    original_Gray = rgb2gray(mov(frameIdx).cdata);
    restored_Gray = restoredVideo(frameIdx).cdata; % already grayscale

    % To calculate difference to see if any change in pixel
    pixel_Difference = double(original_Gray) - double(restored_Gray);

    % obtaining the largest absolute difference from this frame
    current_Max_Error = max(abs(pixel_Difference(:)));
    
    % updating overall max if required
    if current_Max_Error > maxPixelError
        maxPixelError = current_Max_Error;
    end
end

fprintf('Maximum pixel difference across all frames: %d\n', maxPixelError);

if maxPixelError == 0
    fprintf('No difference was found\n');
else
    fprintf('Some differnce was found. Max error = %d\n', maxPixelError);
end

