#!/usr/bin/env ruby

# originally here: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [
  # "git://github.com/astashov/vim-ruby-debugger.git",
  # "git://git.wincent.com/command-t.git",
  # "git://github.com/tpope/vim-speeddating.git",
  # "git://github.com/mjbrownie/swapit.git",
  #
  # General
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-ragtag.git",
  "git://github.com/tpope/vim-unimpaired.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/msanders/snipmate.vim.git",
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/tomtom/tcomment_vim.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/kana/vim-smartpunc.git",
  # Language/syntax specific
  "git://github.com/davidoc/taskpaper.vim.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/juvenn/mustache.vim.git",
  # Ruby and related
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-endwise.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/kana/vim-textobj-user.git",
  "git://github.com/nelstrom/vim-textobj-rubyblock.git"
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

