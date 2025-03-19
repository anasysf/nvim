local opt = vim.opt

opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath 'data' .. '/undo'

opt.path:append '**'
opt.wildmode = 'list:longest,list:full'
opt.wildmenu = true
opt.wildignorecase = true
opt.wildignore:append '.git,.hg,.svn'
opt.wildignore:append '.aux,*.out,*.toc'
opt.wildignore:append '.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class'
opt.wildignore:append '.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp'
opt.wildignore:append '.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg'
opt.wildignore:append '.mp3,*.oga,*.ogg,*.wav,*.flac'
opt.wildignore:append '.eot,*.otf,*.ttf,*.woff'
opt.wildignore:append '.doc,*.pdf,*.cbr,*.cbz'
opt.wildignore:append '.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb'
opt.wildignore:append '.swp,.lock,.DS_Store,._*'
opt.wildignore:append '.,..'

opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

opt.backspace = 'indent,eol,start'

opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'split'

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
