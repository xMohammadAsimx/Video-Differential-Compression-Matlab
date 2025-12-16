# Video-Differential-Compression-Matlab
MATLAB implementation of a simple video compression and restoration pipeline using reference-frame differencing and frame reconstruction.

# Video Differential Compression in MATLAB

## Overview
This project implements a simple video compression and restoration pipeline using reference-frame differencing. The first frame of a video is stored in full, while subsequent frames are represented as pixel-wise differences relative to the reference frame. The original video is then reconstructed from this compressed representation.

The implementation demonstrates fundamental concepts in multimedia security and video coding, including redundancy reduction and reversible compression.

---

## Features
- Reference-frame based video compression
- Frame difference encoding
- Full video restoration from compressed data
- Compression factor computation
- Modular MATLAB implementation

---

## How It Works
1. The first video frame is stored as a reference.
2. Each subsequent frame is encoded as the difference from the reference frame.
3. The compressed representation is stored as a structured data object.
4. The video is reconstructed by adding frame differences back to the reference frame.
5. The compression factor is calculated and displayed.

---

## Usage
1. Place the input video file in the project directory.
2. Run the main script in MATLAB:

---

## Requirements

1. MATLAB (R2020 or newer recommended)
2. Y4M-compatible video input

---

## Notes

This project focuses on conceptual clarity and correctness rather than aggressive compression efficiency. It is intended for educational and experimental purposes.
