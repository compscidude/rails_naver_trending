module TopicsHelper

    def scrape  
        arr = []
        # add the ranks? or other href links later
        doc = Nokogiri::HTML(File.read(open("http://www.naver.com/")))
        doc.css("li[data-order]").css(".ah_k").map do |a|
            arr << a.text
        end
        arr
     end



end
