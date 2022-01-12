class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  
  process resize_to_fit: [150, 150]

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    'no_image.png'
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
