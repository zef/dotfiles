#!/usr/bin/env ruby

# originally here: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [
  # "https://github.com/astashov/vim-ruby-debugger.git",
  # "https://github.com/tpope/vim-speeddating.git",
  # "https://github.com/mjbrownie/swapit.git",
  #
  # General
  "https://github.com/zef/vim-cycle.git",
  "https://git.wincent.com/command-t.git",
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-git.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tpope/vim-ragtag.git",
  "https://github.com/tpope/vim-unimpaired.git",
  "https://github.com/tpope/vim-vividchalk.git",
  "https://github.com/tpope/vim-commentary.git",
  "https://github.com/garbas/vim-snipmate.git",
  "https://github.com/MarcWeber/vim-addon-mw-utils.git",
  "https://github.com/tomtom/tlib_vim.git",
  "https://github.com/mileszs/ack.vim.git",
  "https://github.com/tsaleh/vim-align.git",
  "https://github.com/ervandew/supertab.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/kana/vim-smartpunc.git",
  "https://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/aniero/vim-copy-as-rtf.git",
  "https://github.com/airblade/vim-gitgutter.git",
  # Language/syntax specific
  "https://github.com/davidoc/taskpaper.vim.git",
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tpope/vim-liquid.git",
  "https://github.com/timcharper/textile.vim.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "https://github.com/juvenn/mustache.vim.git",
  "https://github.com/vim-scripts/applescript.vim.git",
  "https://github.com/othree/html5.vim.git",
  "https://github.com/slim-template/vim-slim.git",
  "https://github.com/msanders/cocoa.vim.git",
  "https://github.com/ekalinin/Dockerfile.vim.git",
  "https://github.com/Matt-Deacalion/vim-systemd-syntax.git",
  "https://github.com/evanmiller/nginx-vim-syntax.git",
  "https://github.com/groenewege/vim-less.git",
  "https://github.com/fatih/vim-go.git",
  "https://github.com/jparise/vim-graphql.git",
  "https://github.com/jasonshell/vim-svg-indent.git",
  # "https://github.com/toyamarinyon/vim-swift.git",
  "https://github.com/keith/swift.vim",
  "https://github.com/sirtaj/vim-openscad",
  # Ruby and related
  "https://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/tpope/vim-rails.git",
  "https://github.com/tpope/vim-endwise.git",
  "https://github.com/tpope/vim-haml.git",
  "https://github.com/tpope/vim-cucumber.git",
  "https://github.com/kana/vim-textobj-user.git",
  "https://github.com/nelstrom/vim-textobj-rubyblock.git",
  "https://github.com/tsaleh/vim-shoulda.git",
  "https://github.com/ecomba/vim-ruby-refactoring.git"
]

# also remember sparkup
# https://github.com/rstacruz/sparkup/tree/master/vim


# this is sort of broken, doesn't actually update the plugin since the ID is the download ID
# update manually...
vim_org_scripts = [
  # ["gist",          "12732", "plugin"],
  # http://www.vim.org/scripts/script.php?script_id=1682
  ["IndexedSearch", "7062",  "plugin"],
  # http://www.vim.org/scripts/script.php?script_id=2416
  ["jquery",        "12276", "syntax"],
  # http://www.vim.org/scripts/script.php?script_id=1945
  ["json",          "10853", "syntax"],
	# hexHighlight: http://www.vim.org/scripts/script.php?script_id=2937
  ["hexHighlight",  "12150", "plugin"]
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

trash = ARGV.include?('--trash')

if trash
  puts "Trashing everything (lookout!)"
  Dir["*"].each {|d| FileUtils.rm_rf d }
end

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  if !trash && File.exists?(dir)
    puts " Skipping #{dir}"
    next
  end
  puts " Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  local_file = File.join(name, script_type, "#{name}.#{script_type == 'zip' ? 'zip' : 'vim'}")
  if !trash && File.exists?(local_file)
    puts " Skipping #{local_file}"
    next
  end
  puts " Downloading #{name}"
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  if script_type == 'zip'
    %x(unzip -d #{name} #{local_file})
  end
end

