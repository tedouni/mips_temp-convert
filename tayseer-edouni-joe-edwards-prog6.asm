#Tayseer Edouni
#Joe Edwards


    .data
promptUserScale: .asciiz "Enter Scale:"
promptUserTemp: .asciiz "Enter Temperature:"
resultCelcius: .asciiz "Celsius  Temperature:"
resultFah:     .asciiz "Fahrenheit  Temperature:"
quitStatement: .asciiz "done"
newLine:       .asciiz "\n"

  .text

#bne $t0, $t1, then   a!=b
main:

  mainloop:
  la $a0,promptUserScale
  li $v0,4
  syscall

  li $v0, 12
  syscall


  #ascii for Q = 81
  #check for Done,
  li $t1, 'Q'
  li $t4, 'F'
  li $t5, 'C'
  move $t2,$v0

  #if t2 == 'Q'
  beq $t1, $t2, done

  #if t2 == 'F'
  beq $t4, $t2, ftoc

  #if t2 == 'C'
  beq $t5, $t2, ctof



     #C = (5/9)(F - 32)

      ctof:
          la $a0,newLine
          li $v0,4
          syscall
          la $a0,promptUserTemp
          li $v0,4
          syscall

          li $v0, 5
          syscall

          mul $t0,$v0,9
          div $t0,$t0,5
          add $t0,$t0,32

          la $a0,resultFah
          li $v0,4
          syscall

          move $a0,$t0
          li $v0,1
          syscall

          la $a0,newLine
	        li $v0,4
          syscall
          j mainloop


      #F = (9/5)C + 32

      ftoc:
            la $a0,newLine
            li $v0,4
            syscall

            la $a0,promptUserTemp
            li $v0,4
            syscall

            li $v0, 5
            syscall

            add $t0,$v0,-32
            mul $t0,$t0,5
            div $t0,$t0,9

            la $a0,resultCelcius
            li $v0,4
            syscall

            move $a0,$t0
            li $v0,1
            syscall

            la $a0,newLine
            li $v0,4
            syscall
            j mainloop

        done:
            la $a0,newLine
            li $v0,4
            syscall
            la $a0,quitStatement
            li $v0,4
            syscall
