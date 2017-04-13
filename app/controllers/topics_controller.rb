class TopicsController < ApplicationController

    include TopicsHelper

    def index
        @topics = []
        topic_names = scrape
        topic_names.each_with_index do |name, rank| 

            if (topic = Topic.find_by(name:name))
                topic.rank = (rank+1)
            else
                topic = Topic.new(name: name, rank: (rank+1), rankChange: 0)
            end 
            
            if (topic.save)
                @topics << topic
            end  

        end 
        
    end

    def show
        @topic = Topic.find(params[:id])
    end

end

