require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  install_prelude
  switch_to_zsh
  replace_all = false # this is pretty ugly
  files.each do |file|
    file_handler = FileHandler.new(file, replace_all)
    file_handler.handle
    replace_all = replace_all || file_handler.replace_all
  end
end

def files
  Dir['symlinked/**/*'] - %w[symlinked/emacs.d symlinked/oh-my-zsh]
end

def switch_to_zsh
  if ENV['SHELL'] =~ /zsh/
    puts 'using zsh'
  else
    print 'switch to zsh? (recommended) [ynq] '
    case $stdin.gets.chomp
    when 'y'
      puts 'switching to zsh'
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts 'skipping zsh'
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], '.oh-my-zsh'))
    puts 'found ~/.oh-my-zsh'
  else
    print 'install oh-my-zsh? [ynq] '
    case $stdin.gets.chomp
    when 'y'
      puts 'installing oh-my-zsh'
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts 'skipping oh-my-zsh, you will need to change ~/.zshrc'
    end
  end
end

def install_prelude
  if File.exist?(File.join(ENV['HOME'], '.emacs.d'))
    puts 'found ~/.emacs.d'
  else
    print 'install prelude to .emacs.d? [ynq] '
    case $stdin.gets.chomp
    when 'y'
      puts 'installing prelude'
      system %Q{git clone https://github.com/bbatsov/prelude.git "$HOME/.emacs.d"}
    when 'q'
      exit
    else
      puts 'skipping prelude'
    end
  end
end

class FileHandler < Struct.new(:from_file, :replace_all)
  def handle
    system %Q{mkdir -p "$HOME/.#{File.dirname(to_file)}"} if from_file =~ /\//
    if File.exist?(File.join(ENV['HOME'], "#{to_file}"))
      if File.identical? from_file, File.join(ENV['HOME'], "#{to_file}")
        puts "identical ~/#{to_file}"
      elsif replace_all
        replace_file
      else
        print "overwrite ~/#{to_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          self.replace_all = true
          replace_file
        when 'y'
          replace_file
        when 'q'
          exit
        else
          puts "skipping ~/#{to_file}"
        end
      end
    else
      link_file
    end
  end

  private

  def to_file
    @from_file ||= '.' + from_file.sub('symlinked/', '').sub(/\.erb$/, '')
  end

  def replace_file
    system %Q{rm -rf "$HOME/.#{to_file}"}
    link_file
  end

  def link_file
    if from_file =~ /.erb$/
      puts "generating ~/.#{to_file}"
      File.open(File.join(ENV['HOME'], ".#{to_file}"), 'w') do |new_file|
        new_file.write ERB.new(File.read.result(binding))
      end
    else
      puts "linking ~/.#{to_file}"
      system %Q{ln -s "$PWD/#{from_file}" "$HOME/.#{to_file}"}
    end
  end
end
