require './lib/transform_to_flv'
TransformToFlv.new(
  {
    :file => File.expand_path(File.join('spec', 'video_not_converted', 'movie.wmv')), 
    :output_dir => File.expand_path(File.join('tmp'))
  }
)