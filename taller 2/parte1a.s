.global _start

.data
mi_vector:
    .word 10, 20, 30, 25, 40, 15, 22, 63, 5, 12, 12, 54, 646, 65, 3, 23, 89, 234, 23, 3

N = 20

.text
_start:
    LDR r0, =mi_vector
    MOV r4, #N - 1
	
bucle_externo:

	CMP r4, #0
    BLE done
	MOV r5, #0
	
	
bucle_interno:
	ADD r6, r0, r5, LSL #2
	LDR	r1,[r6]
	LDR	r2,[r6,#4]
	CMP r1, r2
	BGT es_mayor
	luego:
	STR r1, [r6]
	STR r2, [r6,#4]
	ADD r5, r5, #1
	CMP r5,r4
	BLT bucle_interno
	SUB r4, r4,#1
	B bucle_externo
	
	
es_mayor:
	MOV r3,r1
	MOV r1,r2
	MOV r2,r3
	B luego
	
done:
	B done