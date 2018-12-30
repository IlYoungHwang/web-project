package org.seoil.service;

import java.util.List;

import org.seoil.domain.Criteria;
import org.seoil.domain.RentVO;
import org.seoil.domain.SearchCriteria;
import org.seoil.domain.UsedVO;

public interface CarService {
	
	public List<RentVO> rentSearchCriteria(SearchCriteria cri) throws Exception; // 렌트차량 검색
	public int rentSearchCount(SearchCriteria cri) throws Exception; // 렌트차량 검색 페이징
	
	public List<UsedVO> usedSearchCriteria(SearchCriteria cri) throws Exception; // 중고차량 검색
	public int usedSearchCount(SearchCriteria cri) throws Exception; // 중고차량 검색 페이징
	
	public List<RentVO> rentmain() throws Exception; // 메인 렌트차량 목록
	public List<UsedVO> usedmain() throws Exception; // 메인 중고차량 목록
	
	public void rentadd(RentVO vo) throws Exception; //렌트차량 등록
	public void usedadd(UsedVO vo) throws Exception; //중고차량 등록
	
	public List<UsedVO> usedlistAll() throws Exception; // 중고차량 목록
	public List<RentVO> rentlistAll() throws Exception; // 렌트차량 목록
	
	
	public List<UsedVO> usedCriteria(Criteria cri)throws Exception; // 중고차량 전체 페이징
	public int usedCountCriteria(Criteria cri) throws Exception; // 중고차량 전체 게시물 수
	
	//public List<UsedVO> umyCriteria(Integer no) throws Exception; // 나의 중고차량 페이징
	//public int umyCountCriteria(Integer no) throws Exception;  // 나의 중고차량 게시물 수
	
	
	public List<RentVO> rentCriteria(Criteria cri) throws Exception; // 렌트차량 전체 페이
	public int rentCountCriteria(Criteria cri) throws Exception; // 렌트차량 전체 게시물 수
	
	public List<String> rentgetAttach(Integer no) throws Exception; // 렌트차량 사진 가져오기
	public List<String> usedgetAttach(Integer no) throws Exception; // 중고차량 사진 가져오기

	public void rentmodify(RentVO vo) throws Exception; // 렌트차량 수정
	public void usedmodify(UsedVO vo) throws Exception; // 중고차량 수정
	
	public void rentmove(Integer no) throws Exception; // 렌트차량 삭제
	public void usedmove(Integer no) throws Exception; // 중고차량 삭제
	
	public RentVO rentread(Integer no) throws Exception; // 렌트차량 정보 불러오기
	public UsedVO usedread(Integer no) throws Exception; // 중고차량 정보 불러오기
	
	public List<UsedVO> musedlist() throws Exception; // 메인화면 중고차랑 목록
	public List<RentVO> mrentlist() throws Exception; // 메인화면 렌트차량 목록
	

	
}
