# talk-to-chatgpt

## Quick start

- make sure you have the `sdl2` package, in Mac use `brew install sdl2`

- Download Audio-Text model: `./models/download-ggml-model.sh base.en`

  - Models you can choose: "tiny.en" "tiny" "base.en" "base" "small.en" "small" "medium.en" "medium" "large-v1" "large".

- Add your personal API key in `config.json`

```json
{
    "Authorization": "Add your key"
}
```

- Build encode tester `make bench`

- Get your encode time in “whisper_print_timings” part : `./bench -m ./models/ggml-base.en.bin`

- Build example  `make stream`

- Run example `./stream -m ./models/ggml-base.en.bin -t 8 --step 1300 --length 5000`

    If your encode time is 750 ms, then you should use 2 times in parameter `--step`, which is 1300
=======
- run `./models/download-ggml-model.sh base.en`
- make it `make stream`
- run `./stream -m ./models/ggml-base.en.bin -t 8 --step 1300 --length 5000 `

