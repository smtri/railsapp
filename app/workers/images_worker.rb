class ImagesWorker
  include Sidekiq::Worker

  def perform(image_id)
    i = Image.find(params[id: image_id])
    unless i.image.path.nil?
      MiniMagick::Image.new(i.image.path) do |i|
        i.rotate "-90"
      end
    end
  end

end