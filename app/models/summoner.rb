class Summoner < ActiveRecord::Base
    has_many :infos
      validates :link, :uniqueness => true # 중복 db 제거 
      
      
       require 'open-uri' 
       doc=Nokogiri::HTML(open("http://iplol.co.kr/searchranking.iplol?ranker=n"))
       i=0
       a=0
       b=0
       c=1
       while(i<100)


            if doc.css('span.summonerStat')[b].text().include?"(이전"
                b=b+1
                c=c+1
            end       
            Summoner.create(
           # 유저 이름 db에 저장
            :summonerName => doc.css('span.summonerName')[a].text(),
           # 유저 점수 db에 저장

            :lp => doc.css('span.summonerStat')[b].text(),
            
           
           # 유저 승률 db에 저장
            :winrate => doc.css('span.summonerStat')[c].text(),
            
            # 링크 저장
            :link => doc.css('span.summonerName')[a].text()
            )
           i=i+1
           a=a+1
           b=b+3
           c=c+3
           
       end
end
