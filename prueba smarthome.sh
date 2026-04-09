## Rutina del gil laburante: 
## abrir la puerta 
## si la alarma está encendida, que la apague.
## el sensor de movimiento detecta movimiento en la entrada y prende el foco del living y la cocina en blanco al 100%. 
## prende el aire de la pieza en 16. Si la persiana de la pieza está al 100%, la baja por completo al 0%.
 
BEGIN "Gil laburante"
    WHEN cerradura_porton.estado == ON DO
        IF alarma_entrada.estado == ON THEN
            alarma_entrada.activada = OFF
        END
        IF sensor_movimiento_entrada == TRUE THEN
            foco_living.estado = ON
            foco_living.brillo = 100%
            foco_living.color = blanco
            foco_cocina.estado = ON
            foco_cocina.brillo = 100%
            foco_cocina.color = blanco
            aire_pieza.estado = ON
            aire_pieza.modo = FRIO
            aire_pieza.temp_act = sensor_temp_pieza
            IF aire_pieza.temp_act > 30°C THEN
                aire_pieza.temp_obj = 20°C
                ELSE
                aire_pieza.temp_obj = 24°C
            END

            IF persiana_pieza.posicion == 100% THEN
                persiana_pieza.posicion = 0%
            END
        END
    END
END