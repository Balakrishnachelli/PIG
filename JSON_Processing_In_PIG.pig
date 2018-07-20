initialData = LOAD '/home/gopalkrishna/PRAC/PIG/RT-SCRIPT-RELATED/Data.json' USING JsonLoader('website:chararray, location:chararray, rating:int , amount:int');
filterData = FOREACH initialData GENERATE website , location , amount;
selectedData = FILTER initialData BY rating > 15;
sortedData = ORDER filterData BY location;
STORE filterData INTO 'JSONFIL-DATA89';
STORE selectedData INTO 'JSONSEL-DATA89';
STORE sortedData INTO 'JSONSORT-DATA89';
