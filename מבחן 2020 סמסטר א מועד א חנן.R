data=read.csv(file.choose(),header=T)
head(data)
model1=glm(I(Severity<3)~Age+ as.factor(Sex),data = data,family = binomial())
#_____________���� �______
model1$coefficients[1]
model1$coefficients[2]
model1$coefficients[3]
#for woman
1/(1+exp(-1*(b0+b1*age+b2*Sex(2))))

#for_man 
1/(1+exp(-1*(b0+b1*age+0*sex(1))))
#_____________________4_________
#4.	����� ���� ���, �� ����� �� Ps ���� ���� ���� ����� ������� 5, 10, 15, ...., 65, 75, 80. �� ����� ����� ��� ������� ������� ���� (����� �����). 
Age=seq(5,85,5)
#----------------���� ���-----
data_new=data.frame(Age,Sex=1)
predict_1=predict(model1,data_new,type = "response")
#_______���� �� �� ������� ��� ��� �� ���________
z=data$Age%in%seq(5,85,5) & data$Sex==1
#_____________������ ���� ��� ����� ����� ������------
ps_data=tapply(data[z,]$Severity<3,data[z,]$Age, mean)
#------------��� ������  ����� ���� -----
# par("mar")
# par(mar=c(1,1,1,1))
#----------��� ������ ����� �����------
# par(mar = c(5, 4, 4, 2) + 0.1)
#------����� ����� ��� �� ������------
plot(Age,ps_data,ylab = "����� ������ ����� ")
points(Age,predict_1,col="red")
#���� ����� �� ����� �� �� ����� ������ �� �������� ������ ��� ���� ���� ���� ����� �"����" ������ ����� ��� ���� ���� ���� ����� ������� ������ ���� ��� ���� ����������_________
sum(predict(model1,data,type = "response"))

#--------------���� 2----------------
#--------���� ��� ����-----
data=read.csv(file.choose(),header = T)
head(data)
model2=glm(Click_events~Experience+Duration+as.factor(Gender),data = data,family = poisson())
summary(model2)
#--------���� �� 0 �� 1 ��� ���----
b0=model2$coefficients[1]
b1=model2$coefficients[2]
b2=model2$coefficients[3]
b3=model2$coefficients[4]
#__________����� ��� ����� ����� ����� ������� ��� 40 ����---------
1-exp(b3)
#___________������ ��� �0.3 ������-------------
(exp(b1)-1)*100
#------------����� ���-------
data_new=data.frame(Gender="Male",Experience=6,Duration=30)
preicdt_new=predict(model2,data_new,type="response",se= TRUE)
m=preicdt_new$fit
d=1.96*preicdt_new$se.fit
c(m-d,m+d)
#--------------4-------
model3=glm(Click_events~Experience+ log(Duration)+as.factor(Gender),data = data,family = poisson())
summary(model3)
logLik(model2)
logLik(model3)
#-------N��� 3 ����-------- 
sum(predict(model3,newdata=data[data$Gender=="Female",],type = "response"))

sum(predict(model3,newdata=data[data$Experience>6,],type = "response"))
#-----------------���� 3------
years_before=c(1,2,1)
years_after=c(1,1,2)
acc_before=c(12,23,11)
acc_after=c(10,10,22)
##step1:
pai=acc_before/years_before
pai
lamda=acc_after/years_after
lamda
##step2:
var_pai=acc_before/years_before^2
var_pai
var_lamda=acc_after/years_after^2
var_lamda
sigma=abs(lamda-pai)
sum_sigma=sum(sigma)
theta=(sum(lamda)/sum(pai))/1+(sum(var_pai)/sum(pai)^2)
var_sigma=sum(var_pai)+sum(var_lamda)
var_theta=theta^2*(sum(var_pai)/sum(pai)^2+sum(var_lamda)/sum(lamda)^2)/(1+sum(var_pai)/sum(pai)^2)
#_____________���� ��� ������_________
c(sum(sigma)-1.96*sqrt(var_sigma),sum(sigma)+1.96*sqrt(var_sigma))
#_____________���� ��� ������_________
c(theta-1.96*sqrt(var_theta),theta+1.96*sqrt(var_theta))
#___________���� �------------
expected= c(0.0316*800^0.646,
0.0316*1100^0.646,0.0316*950^0.646,
0.0316*860^0.646)
w=1/(1+expected/0.51)
e_acc=w+expected+(1-w)*acc_before
v_acc=e_acc*(1-w)
pai_new=e_acc/years_before
var_pai_new=e_acc/years_before^2
#--------���� ���------
c(pai_new-1.96*sqrt(var_pai_new),pai_new+1.96*sqrt(var_pai_new))
