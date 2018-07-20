register piggybank-0.15.0.jar;
-- DEFINE assigns an alias to an User Defined Function	
DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();
A = LOAD 'hdfs://localhost:8020/PIGXML/technology.xml' using org.apache.pig.piggybank.storage.XMLLoader('book') as (x:chararray);
B = FOREACH A GENERATE (XPath(x, 'book/name')), (XPath(x, 'book/price')),(XPath(x, 'book/copies'));
--B = FOREACH A GENERATE (org.apache.pig.piggybank.evaluation.xml.XPath(x, 'book/name')), (org.apache.pig.piggybank.evaluation.xml.XPath(x , 'book/price')),(org.apache.pig.piggybank.evaluation.xml.XPath(x, 'book/author'));
C = FILTER B BY (int)$2 > 1500;
STORE B INTO '/XMLPIGOUT30';
STORE C INTO '/FILTERXML30';

