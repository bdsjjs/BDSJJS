local weaponsFolderPath = game:GetService("ReplicatedStorage").Modules.Gameplay.Weapons

if not weaponsFolderPath then
    warn("通知: 未找到文件夹: " .. tostring(weaponsFolderPath))
    return
end

for _, weaponModule in ipairs(weaponsFolderPath:GetChildren()) do

    if weaponModule:IsA("ModuleScript") then
        

        local success, weaponData = pcall(function()
            return require(weaponModule)
        end)
        
        if success and type(weaponData) == "table" then

            weaponData.Damage = 1500 -- 伤害

            weaponData.Ammo = 99999 -- 弹药

            weaponData.FireRate = 0.01 -- 射速


            weaponData.ReloadTime = 0.01 -- 换弹速度
            weaponData.Spread = 0 -- 无散布

 
            weaponData.Recoil = 0 -- 无后坐力
             weaponData.BulletSpeed = 10000 -- 子弹速度

 
            if weaponData.FullDamageDist then
                weaponData.FullDamageDist = 9999 -- 无伤害衰减
            end

            if weaponData.Knockback then
                weaponData.Knockback = 0 -- 击退
            end

            if weaponData.LimbMultipliers and type(weaponData.LimbMultipliers) == "table" then
                for partName, _ in pairs(weaponData.LimbMultipliers) do
 
                    weaponData.LimbMultipliers[partName] = 10 -- 所有部位伤害倍率
                end
            end
 
            print("成功修改武器: " .. weaponModule.Name)
        else
            warn("失败: " .. weaponModule.Name)
        end
    end
end
