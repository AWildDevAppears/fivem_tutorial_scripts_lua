local spawnPos = vector3(-275.522, 6635.835, 7.425)

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

RegisterCommand( 'car', function( source, args )
    TriggerEvent( 'chat:addMessage', {
        args = { 'Prepping to spawn vehicle: ' .. ( args[1] or 'adder' ) } }
    } )
end, false )
