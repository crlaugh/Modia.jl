
module TestCauerLowPassFilter

println("\nTestCauerLowPassFilter: Demonstrating the ability to simulate an electrical model translated from Modelica Standar Library")

using Modia
using Modia.Electric

# Desired:
#   using ModiaMath: plot
#
# In order that ModiaMath need not to be defined in the user environment, it is included via Modia:
using Modia.ModiaMath: plot


@model CauerLowPassOPV begin
  # Cauer low pass filter with operational amplifiers
  l1=1.304
  l2=0.8586
  c1=1.072
  c2=1/(1.704992^2*l1)
  c3=1.682
  c4=1/(1.179945^2*l2)
  c5=0.7262

  C1=Capacitor(C=c1 + c2)
  C2=Capacitor(C=c2)
  C3=Capacitor(C=l1)
  C4=Capacitor(C=c4)
  C5=Capacitor(C=c2, v=Float(state=false))
  R1=Resistor(R=1)
  R2=Resistor(R=1)
  R3=Resistor(R=1)
  Op1=IdealOpAmp3Pin()
  G=Ground()
  R4=Resistor(R=-1)
  R5=Resistor(R=-1)
  Op2=IdealOpAmp3Pin()
  Op3=IdealOpAmp3Pin()
  G1=Ground()
  R6=Resistor(R=1)
  R7=Resistor(R=1)
  C6=Capacitor(C=c2 + c3 + c4, v=Float(state=false))
  R8=Resistor(R=-1)
  R9=Resistor(R=-1)
  R10=Resistor(R=1)
  Op4=IdealOpAmp3Pin()
  Op5=IdealOpAmp3Pin()
  C7=Capacitor(C=l2, v=Float(start=0))
  C8=Capacitor(C=c4, v=Float(state=false))
  C9=Capacitor(C=c4 + c5, v=Float(state=false))
  R11=Resistor(R=1)
  n1=Pin()
  n2=Pin()
  n3=Pin() 
  n4=Pin() 
  n5=Pin()   
  p1=Pin()   
  n6=Pin() 
  n7=Pin() 
  n8=Pin()
  p2=Pin()
  out1=Pin()  
  p3=Pin() 
  n9=Pin()
  n10=Pin()
  n11=Pin()
  G2=Ground()
  n12=Pin()
  n13=Pin()
  p4=Pin()
  n14=Pin()
  G3=Ground()
  G4=Ground()
#  V=StepVoltage(startTime=10, V=1)
  V=ConstantVoltage(V=1)
  Ground1=Ground()
  obs=Float(start=0.0)
@equations begin 
  connect(Op1.in_p, G.p) 
  connect(G1.p, Op2.in_p) 
  connect(R1.n, n1) 
  connect(n1, Op1.in_n) 
  connect(C2.n, n1) 
  connect(R2.n, n2)
  connect(n1, n2)
  connect(n2, n3)
  connect(n3, C1.p)
  connect(n3, R3.p) 
  connect(C1.n, n4)
  connect(R3.n, n4) 
  connect(n4, Op1.out) 
  connect(R4.p, Op1.out) 
  connect(C5.p, Op1.out) 
  connect(R4.n, n5) 
  connect(n5, Op2.in_n) 
  connect(C3.p, n5) 
  connect(R5.n, n5) 
  connect(R5.p, p1) 
  connect(C2.p, p1) 
  connect(C3.n, n6)
  connect(n6, Op2.out)
  connect(R2.p, n6) 
  connect(Op2.out, R7.p)
  connect(R7.n, n7)
  connect(n7, Op3.in_n) 
  connect(C5.n, n7) 
  connect(R6.n, n8)
  connect(n7, n8) 
  connect(C6.p, p2)
  connect(n8, p2)
  connect(C4.n, p2) 
  connect(C6.n, Op3.out) 
  connect(R9.p, Op3.out)
  connect(Op3.out, out1)
  connect(p1, out1) 
  connect(out1, C8.p) 
  connect(C4.p, p3) 
  connect(p3, R8.p)
  connect(R8.n, n9)
  connect(n9, n10)
  connect(R9.n, n10)
  connect(n10, Op4.in_n) 
  connect(n9, C7.p) 
  connect(C7.n, n11)
  connect(R6.p, n11) 
  connect(n11, Op4.out)
  connect(Op4.out, R10.p)
  connect(G2.p, Op3.in_p) 
  connect(R11.n, n12)
  connect(p3, n12) 
  connect(C9.n, n13)
  connect(n12, n13)
  connect(n13, Op5.out)
  connect(C9.p, p4)
  connect(R11.p, p4) 
  connect(R10.n, n14)
  connect(p4, n14)
  connect(Op5.in_n, n14) 
  connect(C8.n, n14) 
  connect(Op4.in_p, G3.p) 
  connect(Op5.in_p, G4.p) 
  connect(V.p, Ground1.p)            
  connect(V.n, R1.p)  
  der(obs) = 100000*(Op5.out.v-obs)
  end
end

result = checkSimulation(CauerLowPassOPV, 60, "C9.v", -0.5003139583081188, logTranslation=true)

@model CauerLowPassOPVWithoutNodes begin
  # Cauer low pass filter with operational amplifiers
  l1=1.304
  l2=0.8586
  c1=1.072
  c2=1/(1.704992^2*l1)
  c3=1.682
  c4=1/(1.179945^2*l2)
  c5=0.7262

  C1=Capacitor(C=c1 + c2)
  C2=Capacitor(C=c2)
  C3=Capacitor(C=l1)
  C4=Capacitor(C=c4)
  C5=Capacitor(C=c2, v=Float(state=false))
  R1=Resistor(R=1)
  R2=Resistor(R=1)
  R3=Resistor(R=1)
  Op1=IdealOpAmp3Pin()
  G=Ground()
  R4=Resistor(R=-1)
  R5=Resistor(R=-1)
  Op2=IdealOpAmp3Pin()
  Op3=IdealOpAmp3Pin()
  G1=Ground()
  R6=Resistor(R=1)
  R7=Resistor(R=1)
  C6=Capacitor(C=c2 + c3 + c4, v=Float(state=false))
  R8=Resistor(R=-1)
  R9=Resistor(R=-1)
  R10=Resistor(R=1)
  Op4=IdealOpAmp3Pin()
  Op5=IdealOpAmp3Pin()
  C7=Capacitor(C=l2, v=Float(start=0))
  C8=Capacitor(C=c4, v=Float(state=false))
  C9=Capacitor(C=c4 + c5, v=Float(state=false))
  R11=Resistor(R=1)

  G2=Ground()
  G3=Ground()
  G4=Ground()
#  V=StepVoltage(startTime=1, V=1)
  V=ConstantVoltage(V=1)
  Ground1=Ground()
@equations begin 
  connect(Op1.in_p, G.p) 
  connect(G1.p, Op2.in_p) 
  connect(R1.n, Op1.in_n) 
  connect(C2.n, R1.n) 
  connect(R1.n, R2.n)
  connect(R2.n, C1.p)
  connect(R2.n, R3.p) 
  connect(R3.n, C1.n) 
  connect(C1.n, Op1.out) 
  connect(R4.p, Op1.out) 
  connect(C5.p, Op1.out) 
  connect(R4.n, Op2.in_n) 
  connect(C3.p, R4.n) 
  connect(R5.n, R4.n) 
  connect(C2.p, R5.p) 
  connect(C3.n, Op2.out)
  connect(R2.p, C3.n) 
  connect(Op2.out, R7.p)
  connect(R7.n, Op3.in_n) 
  connect(C5.n, R7.n) 
  connect(R7.n, R6.n) 
  connect(R6.n, C6.p)
  connect(C4.n, C6.p) 
  connect(C6.n, Op3.out) 
  connect(R9.p, Op3.out)
  connect(R5.p, Op3.out) 
  connect(Op3.out, C8.p) 
  connect(C4.p, R8.p)
  connect(R9.n, R8.n)
  connect(R8.n, Op4.in_n) 
  connect(R8.n, C7.p) 
  connect(R6.p, C7.n) 
  connect(C7.n, Op4.out)
  connect(Op4.out, R10.p)
  connect(G2.p, Op3.in_p) 
  connect(C4.p, R11.n) 
  connect(R11.n, C9.n)
  connect(C9.n, Op5.out)
  connect(R11.p, C9.p) 
  connect(C9.p, R10.n)
  connect(Op5.in_n, R10.n) 
  connect(C8.n, R10.n) 
  connect(Op4.in_p, G3.p) 
  connect(Op5.in_p, G4.p) 
  connect(V.p, Ground1.p)            
  connect(V.n, R1.p)  
  end
end

result = checkSimulation(CauerLowPassOPVWithoutNodes, 60, "C9.v", -0.5003139583081188)
plot(result, ("C9.v"), figure=20)
result = checkSimulation(CauerLowPassOPVWithoutNodes, 60, "C9.v", -0.5003139583081188, tearing=true)
plot(result, ("C9.v"), figure=20)


end