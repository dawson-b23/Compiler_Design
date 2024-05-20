/**
 * @file scanType.h
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * @brief 
 * @version 2.0
 * @date 2024-05-20
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_

struct TokenData
{
    int  tokenclass;        // token class
    int  linenum;           // line where found
    char *tokenstr;         // what string was read (pointer)
    char cvalue;            // any character value
    int  nvalue;            // any numeric value or Boolean value
    char *svalue;           // any string value e.g. an id (pointer)
};
#endif
