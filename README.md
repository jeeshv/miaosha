#ʹ�õ��ļ���
������������MD5����
JSR303����У�� & ȫ���쳣������

###�������ģʽ
####��������վ���֮������µ���·
http://blog.csdn.net/tTU1EvLDeLFq5btqiK/article/details/78693323

####�ֲ�ʽSESSION

####ʵ��HandlerMethodArgumentResolver����дresolveArgument�������Զ����������
 1. WebConfig  extends WebMvcConfigurerAdapter
 2. UserArgumentResolver implements HandlerMethodArgumentResolver 
 
 ####��ƷID
 snowflake : Twitter�ķֲ�ʽ����ID�㷨snowflake (Java��)
 https://www.cnblogs.com/relucent/p/4955340.html
 snowflake���ɵ�ID�����ϰ���ʱ���������򣬲��������ֲ�ʽϵͳ�ڲ������ID��ײ����datacenter��workerId�����֣�������Ч�ʽϸߡ�������snowflakeÿ���ܹ�����26���ID��
 
 ##��չ
 �����������㷨֮����ʵ����һЩ��չ�������������
 
 �����Լ�ҵ���޸�ÿ��λ�δ洢����Ϣ���㷨��ͨ�õģ����Ը����Լ������ʵ�����ÿ�εĴ�С�Լ��洢����Ϣ��
 ����id������id��ÿ�ζ��������ض�����Ϣ�������õ�һ��id��Ӧ�ÿ��Գ��Է��Ƴ�ԭʼ��ÿ���ε���Ϣ�����Ƴ�����Ϣ���԰������Ƿ�����������Ϊ����������֪���ö������������ڣ���������������ĵȵȡ�
 
 ###����workid������ô��֤Ψһ�أ���������n��docker����Щdocker��ҵ�Ȼ������
 
����ͨ���ֲ�ʽ�������������ID��workid֮���ӳ���ϵ��������ʱ����ʷֲ�ʽ�����ѯ��ǰ����ID��Ӧ��workid�������ѯ�������ȡһ�������浽�ֲ�ʽ�����С�

###Jmeterѹ������