#!/bin/sh
docker run  -v  $(pwd)/data:/data --rm -it theia '/opt/TheiaSfM-0.5/applications/extract_features --input_images=/data/job/1/photos/*.jpg --features_output_director=/data/job/1/features/--num_threads=4 --descriptor=SIFT --logtostderr'
