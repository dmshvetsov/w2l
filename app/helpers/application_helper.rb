module ApplicationHelper
  #return path to full screen background image, installed in application layout
  def random_bg
    blacklist = [".", "..",".DS_Store"]
    file_names = Dir.entries("#{Rails.root}/app/assets/images/bg-fullscreen/")
    blacklist.each do |blacklsited|
      file_names.delete(blacklsited)
    end
    "bg-fullscreen/#{file_names.shuffle.first}"
  end
  #sorted samples of items for chars of tags & localities
  def chart_sorted_sample(number, array_of_hashes)
    array_of_hashes.sample(number).sort_by {|item| item[:name]}
  end
end
