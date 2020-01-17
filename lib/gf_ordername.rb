class GfOrdername
  def self.order_name
    current_project = `pwd`
    current_project = current_project.gsub(/\n/,"")
    content = File.read(current_project + "/Gemfile")
    # process in here
    content = content.gsub(/\#\s.*\s*/,"")
    content = content.gsub(/'/, '"')
    puts content

    File.open(current_project + "/Gemfile", "w") do |file|
      file.puts content
    end
    system "echo", "-e", "\e[92mYour Gemfile was successfully ordered!"
  rescue Exception => e
    system "echo", "-e", "\e[91m#{e.message}"
    system "echo", "-e", "\e[91mMake sure you're in the right place!"
  end
end
