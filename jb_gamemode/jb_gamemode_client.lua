local spawnPos = vector3( 686.245, 577.950, 130.461 )

AddEventHandler( 'onClientGameTypeStart', function()
    exports.spawnManager:setAutoSpawnCallback( function()
        exports.spawnManager:spawnPlayer( {
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_m_skater_01'
        }, function()
            TriggerEvent( 'chat:addMessage', {
                args = { 'Welcome to the party!!' }
            } )
        end )
    end )

    exports.spawnManager:setAutoSpawn( true )
    exports.spawnManager:forceRespawn()
end )
