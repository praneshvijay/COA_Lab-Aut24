/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001459356167_3044694732_init();
    work_m_00000000001212840961_2513369863_init();
    work_m_00000000003755234884_4283165369_init();
    work_m_00000000003211323777_0440837616_init();
    work_m_00000000003145846926_3249525169_init();
    work_m_00000000002269425704_2931590337_init();
    work_m_00000000002806017707_1854666353_init();
    work_m_00000000002806017707_0276882865_init();
    work_m_00000000002806017707_2790042417_init();
    work_m_00000000002806017707_2039910602_init();
    work_m_00000000002712040289_1246873435_init();
    work_m_00000000000871153957_0470507741_init();
    work_m_00000000000871153957_2965254097_init();
    work_m_00000000000871153957_1723761585_init();
    work_m_00000000002572977207_0022450907_init();
    work_m_00000000003813605231_3990966929_init();
    work_m_00000000001824656050_3560780154_init();
    work_m_00000000001824656050_2323643723_init();
    work_m_00000000001212675347_0284453607_init();
    work_m_00000000001212675347_3167850982_init();
    work_m_00000000003105833703_3376809781_init();
    work_m_00000000003105833703_2485918563_init();
    work_m_00000000000305111101_3003816664_init();
    work_m_00000000001935726300_1474584815_init();
    work_m_00000000003198476428_0551768185_init();
    work_m_00000000003529277249_3444541860_init();
    work_m_00000000001202043185_2134439111_init();
    work_m_00000000001687835046_3342174595_init();
    work_m_00000000002881388157_3807996471_init();
    work_m_00000000000200166810_1111014233_init();
    work_m_00000000001982343132_1632666855_init();
    work_m_00000000001193652292_2640495359_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001193652292_2640495359");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
