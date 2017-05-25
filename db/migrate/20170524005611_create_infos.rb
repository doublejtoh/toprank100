class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :summonerId # Summoner table의 id값(외래키)
      t.string :summonerInfo # 유저에 대한  정보
      t.timestamps null: false
    end
  end
end
