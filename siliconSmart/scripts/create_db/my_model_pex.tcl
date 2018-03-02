read_lib ../testcase_pex/models/liberty/my_model_op_cond_typ.lib
write_lib op_cond_typ -format db -output db/my_model_op_cond_typ.db

read_lib ../testcase_pex/models/liberty/my_model_op_cond_fast.lib
write_lib op_cond_fast -format db -output db/my_model_op_cond_fast.db

read_lib ../testcase_pex/models/liberty/my_model_op_cond_slow.lib
write_lib op_cond_slow -format db -output db/my_model_op_cond_slow.db

exit