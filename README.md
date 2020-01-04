# More_Monsters

モンスターの数を増やしたいあなたに。このデータパックは、敵の出現率を増加させることが出来ます。

***

I recommend this for you want to increase monsters. This datapack increases spawn rate in monsters.<br><br>

# 導入方法 / How to install
1. 保存したzipファイルを解凍し、そのファイルをsaves/(ワールド名)/datapacksに入れます。 <br>
※なお、対応バージョンは1.14~となります。
***

1. Uncompress saved the file, and set in saves/(world name)/datapacks it. 。<br>
※Support Version is 1.14~.
<br><br>

# コンフィグ / Config
このデータパックにはコンフィグが存在します。まずコンフィグを確認したい場合は、**/function more_monsters:config**と入力します。<br>
There are the config in this datapack. When checking config, /function more_monsters:config in chat.


コンフィグで確認、変更できる項目は、以下のようになります :<br>
Checkable and Changeable points is under :

<dl>
  <dt>■ MaxRepeats</dt>
  <dd>モンスターの最大抽選回数です。モンスターの出現する確率は50％なため、実際はこの半分が目安となります。
  <br>This is max chance number in spawning monsters. Monsters spawn chance is 50%, so the indicator is this number half actually.</dd>
  <dt>■ IsRecursiveSpawn</dt>
  <dd>モンスターを1tickでスポーンさせるかどうかです。通常、MaxRepeatsの数が大きい場合はfalseの方が無難です。
  <br>This is whether monsters spawn in 1tick. Ordinally, false is better when MaxRepeats is larger.</dd>
</dl>
<br>

# スポーン抽選率 / Spawning rate
スポーンするモンスターは、オーバーワールド、ネザー、エンドで違います。どのモンスターがどの確率でスポーンするかを一覧に記載しておきました。<br>
なお、この確率はモンスターがスポーンすると確定している確率であり、実際にはスポーンしない確率(50%)もあるのでご注意ください。<br>
***
Spawning monsters are different in overworld or nether or the end. I was collected the table that which monster has how much spawning rate.<br>
Even, this rate has determined that monsters will spawn, so apart from that there are monsters don't spawning rate(50%) actually.
<br><br><br>
**オーバーワールド / Overworld**

| 出現するモンスター<br>Spawning monsters | ウェイト<br>Weight | 確率<br>Probability |
|:----------:|:-----------:|:------------:|
| ゾンビ<br>Zombie | 100 | 14.9% |
| ハスク<br>Husk | 50 | 7.5% |
| 村人ゾンビ<br>Zombie Villager | 50 | 7.5% |
| スケルトン<br>Skeleton | 100 | 14.9% |
| ストレイ<br>Stray | 50 | 7.5% |
| スライム<br>Slime | 100 | 14.9% |
| スパイダー<br>Spider | 100 | 14.9% |
| クリーパー<br>Creeper | 100 | 14.9% |
| エンダーマン<br>Enderman | 20 | 3.0% |
| ファントム<br>Phantom | 5 | 0.7% |
| ウィッチ<br>Witch | 20 | 3.0% |
| ピリジャー<br>Pillager | 10 | 1.5% |
| ヴィンディケーター<br>Vindicator| 10 | 1.5% |
| ラヴェジャー<br>Ravager | 1 | 0.1% |
<br>

**ネザー / Nether**

| 出現するモンスター<br>Spawning monsters | ウェイト<br>Weight | 確率<br>Probability |
|:----------:|:-----------:|:------------:|
| ゾンビピッグマン<br>Zombie Pigman | 30 | 24.8% |
| ブレイズ<br>Blaze | 30 | 24.8% |
| ウィザースケルトン<br>Wither Skeleton | 30 | 24.8% |
| マグマキューブ<br>Magma Cube | 30 | 24.8% |
| エンダーマン<br>Blaze | 1 | 0.8% |
<br>

**エンド / The End**

| 出現するモンスター<br>Spawning monsters | ウェイト<br>Weight | 確率<br>Probability |
|:----------:|:-----------:|:------------:|
| エンダーマン<br>Enderman | 100 | 99.0% |
| シュルカー<br>Shulker | 1 | 1.0% |
<br>

なお、ドラウンドとガーディアンとガストは自然スポーンした際にスポーン抽選します。スポーン抽選の確率は同じです(成功率50%)。

***

Drowned, guardian and ghast will spawn in random chance when naturally own spawned. Spawning rate is same(Success rate 50%).
<br><br>
# 更新履歴 / Changelogs
### Ver.1.1


### 変更点 / Changes
* シュルカーはデスポーンしないため、追加でスポーンしたシュルカーはデスポーンするようになった。<br>Shulker spawned from this datapack can despawn because shulker doesn't despawn ordinally.
* スポーンに使うエンティティをアーマースタンドからエリアエフェクトクラウドに変更。<br>Entity of using spawn changed area effect cloud from armor stand.
* スポーン抽選が外れた際に出現していたアイテムを無くした。<br>Removed spawning item when monster doesn't spawn.
* 再ログイン時に実行されるload.mcfunctionがadvancementを介さなくなった。<br>load.mcfunction is no longer through advancement when running relogin.
* 再ログイン時や再リロード時に実行されるtellrawを見やすいように変更。<br>Tellraw text when running relogin or reloading see better before.


### Ver.1.0
初公開。<br>
First release.
