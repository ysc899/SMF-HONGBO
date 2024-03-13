package com.seegene.web.repository.oracle;


import com.seegene.web.admin.inspection.test.vo.*;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Oracle 검사 조회 관련 맵퍼
 */
@Mapper
public interface OracleInspectionTestMapper {

    /* 공통 코드 */
    List<DB2CodeRO> getCommCodeOra(List<String> searchCodes);

    /* 검사 항목 조회 */
    List<MWT001R1ListRO> inspectionTestListOra(MWT001R1SearchPO searchParam);

    /* 검사 항목 상세 */
    MWT001R2ViewRO inspectionTestViewOra(MWT001R2SearchPO searchParam);
}
