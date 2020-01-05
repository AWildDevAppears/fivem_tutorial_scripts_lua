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
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdImage( vehicleName ) or not IsModelAVehicle( vehicleName )
        TriggerEvent( 'chat:addMessage', {
            args: { vehicleName .. ' is not a valid vehicle name' }
        } )
    end

    TriggerEvent( 'chat:addMessage', {
        args = { 'Prepping to spawn vehicle: ' .. vehicleName } }
    } )

    RequestModel( vehicleName )

    while not HasModelLoaded( vehicleName ) do
        Wait( 500 )
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords( playerPed )

    local vehicle = CreateVehicle( vehicleName, pos.x, pos.y, pos.z, GetEntityHeading( playerPed ), true, false )

    SetPedIntoVehicle( playerPed, vehicle, -1 )

    SetEntityAsNoLongerNeeded( vehicle )
    SetModelAsNoLongerNeeded( vehicleName )

    TriggerEvent('chat:addMessage', {
		args = { 'Woohoo! Enjoy your new ^*' .. vehicleName .. '!' }
	} )
end, false )
