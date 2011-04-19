require './lib/bundle'

NotFoundOutputDir = Class.new(RuntimeError)
NotFoundFile = Class.new(RuntimeError)

class TransformToFlv  
  def initialize(params = {})
    @file = params[:file] || raise(NotFoundFile)
    @output = params[:output_dir] || raise(NotFoundOutputDir)
    @file_path = File.path(@file)
    @filename = File.basename(@file_path, File.extname(@file_path))
    
    transform!
  end
  
  def has_output?
    File.exist?(File.join(@output, "#{@filename}.flv"))
  end
  
  protected
  
  def transform!
    system(cmd) && $?.exitstatus == 0
  end
  
  def cmd
    flv = File.join(@output, "#{@filename}.flv")
    File.open(flv, 'w')
    
    command_string = <<-shell
    ffmpeg -i #{ @file_path } -ar 22050 -ab 32 -acodec libmp3lame 
    -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ flv }
    shell
    command_string.gsub!(/\s+/, " ")    
  end
end