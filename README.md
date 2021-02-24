# Gerlach

Autoload
-ChangeScene เป็นการเปลี่ยน Scent โดยการส่ง EvenEvents.emit_signal("change",$"/root/Global".scene)
โดย $"/root/Global".scene 
เป็นตัวแปลสำหรับเปลี่ยน Scene

Battle
ลดเลือกสตรู Function _Correct(damages)
ลดเลือกผู้เล่น Function _not_correct(damages)
โดย damages ให้ส่งเป็นตัวเลข 0 - 100

ChangeScene
เริ่มต้น Scene ต้องใส่ ID ประจำ Scene ด้วย  $"/root/Global".scene = IDScen

Enemy_Inventory หรือ Enemy จะตรวจดูว่า Enemy ไหนต่อสู้ไปแล้วบ้าง  โดยดูจาก $"/root/Global".mission_complete