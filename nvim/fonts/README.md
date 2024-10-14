## Font

https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#examples

Font patched with icons `--fontawesome --octicons --pomicons --complete`

## How to patched font

```
make patched/
make patchme/

cp -R ~/Library/Fonts/JetBrainsMonoNL*.ttf patchme/

 docker run --rm \
  -v ${PWD}/patchme:/in:Z \
  -v ${PWD}/patched:/out:Z \
  nerdfonts/patcher \
  --fontawesome --octicons --pomicons --complete
```

the patched font will be in `patched/`

## How to install font

```
cp -R patched/* ~/Library/Fonts/
```

Font name after patched: `JetBrainsMonoNL Nerd Font`
