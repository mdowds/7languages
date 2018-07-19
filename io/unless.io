unless := method(
    (call sender doMessage(call message argAt(0))) ifTrue(
    call sender doMessage(call message argAt(2))) ifFalse(
    call sender doMessage(call message argAt(1)))
)

unless(1==2, "One is not two" println, "One is two" println)
