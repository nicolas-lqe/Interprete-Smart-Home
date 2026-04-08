//Detección de temperatura alta y encender el aire en 16

BEGIN "Deteccion"

    WHEN sensor_temp > 32°C DO
        aire_pieza.estado = ON
        aire_pieza.modo = FRIO
        aire_pieza.temp = 16°C
        IF reloj_pieza.hora >= 12:00 THEN
            persiana_pieza.posicióon = 50%
            ELSE
            persiana_pieza.posicióon = 100%
        END
    END
END