
sub esp, 112
mov eax, dword[esp + 0], 7
mov eax, dword[esp + 4], 5
mov eax, dword[esp + 8], 3
mov eax, dword[esp + 12], 4
mov eax, dword[esp + 16], 6
mov eax, dword[esp + 20], 9

mov eax, dword[esp + 24], 4
mov eax, dword[esp + 28], 4
mov eax, dword[esp + 32], 4
mov eax, dword[esp + 36], 4
mov eax, dword[esp + 40], 4
mov eax, dword[esp + 44], 4

mov eax, dword[esp + 48], 9
mov eax, dword[esp + 52], 7
mov eax, dword[esp + 56], 5
mov eax, dword[esp + 60], 3
mov eax, dword[esp + 64], 2
mov eax, dword[esp + 68], 1

mov eax, dword[esp + 72], 1
mov eax, dword[esp + 76], 2
mov eax, dword[esp + 80], 3
mov eax, dword[esp + 84], 5
mov eax, dword[esp + 88], 7
mov eax, dword[esp + 92], 9

mov eax, dword[esp + 96], 9
mov eax, dword[esp + 100], 7

mov eax, dword[esp + 104], 7
mov eax, dword[esp + 108], 9

#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))

call main
#stop

; v = [esp + 4]
; size = [esp + 8]
; i = eax

find_minimum:
    mov ebx, 0
    mov ecx, dword[esp+8] 
    cmp ebx, ecx  ;size == 0 
    je if
    mov ebx, 1
    cmp ebx, ecx ;size == 1
    je else

    mov eax, 0

while:
    cmp ecx, eax-1
    jge end_while

    mov ebx, 4
    mul ebx ; i*4 para avanzar 
    mov ebx, dword[eax + eax] ; ebx = v[i]
    mov edx, dword[eax + eax+1] ; edx = v[i+1]
    cmp eax, ebx
    jge end_while

    add eax, 1 ;i++
    jmp while

if:
    ret -1

else:
    ret 0

end_while:
    ret

test:
    sub esp, 12
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 4] 
    push eax
    call arraySum
    #show esp
    add esp, 12
    ret

main:

    call test
    ret