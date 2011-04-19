require 'spec_helper'

describe TransformToFlv do
  context "raise errors" do
    it "when i don't pass the output dir raise a NotFoundOutputDir exception" do
      lambda {TransformToFlv.new({:file => "lorem"})}.should raise_exception(NotFoundOutputDir) 
    end
    
    it "when i don't pass the file raise a NotFoundFile exception" do
      lambda {TransformToFlv.new()}.should raise_exception(NotFoundFile) 
    end    
  end
  context "when i have a movie file" do
    before(:each) do
      @file_not_converted = File.expand_path(File.join('spec', 'video_not_converted', 'movie.wmv'))
    end
    
    it "when i pass the movie to convert then i should see the file in the output dir" do
      @process = TransformToFlv.new({:file => @file_not_converted, :output_dir => File.expand_path(File.join('spec','video_converted'))})
      @process.has_output?.should be_true
    end
  end
end
