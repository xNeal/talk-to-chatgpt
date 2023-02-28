# talk-to-chatgpt


## Quick start
- make sure you have the `sdl2` package, in Mac use `brew install sdl2`
- run `./models/download-ggml-model.sh base.en`
- make it `make stream`
- run `./stream -m ./models/ggml-base.en.bin -t 8 --step 1300 --length 5000 `
