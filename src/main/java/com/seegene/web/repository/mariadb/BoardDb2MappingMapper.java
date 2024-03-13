package com.seegene.web.repository.mariadb;

import com.seegene.web.admin.board.db2.vo.Db2BoardMappingVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * db2 게시판 맵핑용 맵퍼
 */
@Mapper()
public interface BoardDb2MappingMapper {
	void addDb2Mapping(Db2BoardMappingVO param);
	
	int countDb2Mapping();
	
	Db2BoardMappingVO findDb2Mapping(Db2BoardMappingVO param);
}
