module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.format 'jpg'
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end