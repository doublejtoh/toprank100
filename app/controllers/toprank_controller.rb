class ToprankController < ApplicationController
    def index # fow에서 탑랭크 1~100위 유저들의 정보를 받아옴(순위,닉네임,티어,점수,승률)
     
       @summoners=Summoner.all
       
       
    end
    
    def showinfo # 소환사의 정보( 다른 사람들이 작성한)
        @summoner=Summoner.find(params[:summonerId])
        @summonerinfo=Info.where(:summonerId => params[:summonerId])
    end
    
    def write_info # 탑랭크 1~100위 까지 유저들중 한명을 선택해서 정보를 입력함 (게시글처럼)
    
    end
    
    def create_info # write_info에서 넘어온 것을 DB에 저장
        
        newinfo=Info.new
        newinfo.summonerInfo=params[:summonerInfo]
        newinfo.summonerId=params[:summonerId]
        newinfo.save
        url="/showinfo/"+params[:summonerId]
        
        redirect_to url
    end
    
    def destroy_info # 탑랭크 1~100위 까지 유저들중 한명을 선택해서 정보를 삭제
        summonerInfo=Info.find(params[:infoId])
        summonerInfo.destroy
        summonerId=params[:summonerId]
        summonerIdStr=summonerId.to_s
        
        url="/showinfo/"+params[:summonerId]
        redirect_to url
    end
    
    def edit_info # 탑랭크 1~100위 까지 유저들중 한명을 선택해서 정보를 수정
        @summonerinfo=Info.find(params[:infoId])
        @info=@summonerinfo.summonerInfo
        @summonerId=@summonerinfo.summonerId
        @infoId=@summonerinfo.id
      

        
    end
    
    def update_info # edit_info 에서 넘어온 것을 DB에 저장
        
        newInfo=Info.find(params[:infoId])
        newInfo.summonerId=params[:summonerId]
        newInfo.summonerInfo=params[:summonerInfo]
        newInfo.save
        url="/showinfo/"+params[:summonerId]
        redirect_to url
    end
end
