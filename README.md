# talk-to-chatgpt


## Quick start
- make sure you have the `sdl2` package, in mac use `brew install sdl2`
- run `sh download-ggml-model.sh base.en`
- make it `make base.en`
- run `./stream -m ./ggml-base.en.bin -t 8 --step 500 --length 5000 `