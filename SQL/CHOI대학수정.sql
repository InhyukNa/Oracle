alter table tb_class
    add constraint preattending_class_no_fk foreign key(preattending_class_no)
    references tb_class(class_no);