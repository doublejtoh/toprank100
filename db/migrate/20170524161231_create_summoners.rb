class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :summonerName # 소환사 이름
      t.string :lp # 소환사 점수
      t.string :winrate # 승률
      t.string :link # db 중복 저장 방지
      t.timestamps null: false
    end
  end
end
