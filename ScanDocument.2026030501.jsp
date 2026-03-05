<!DOCTYPE html>
<html>
	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%> 
	<%@ page import="java.util.List,java.util.ArrayList,ae.gov.cpc.toolbar.scan.ListItem" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<head>
		<script src="Resources/config.js"></script> 
	  
		<% 
		String lang = request.getParameter("language").toLowerCase();
		if(lang.contains("en")){
		%>	
		<fmt:setLocale value="en_US"/>
		<fmt:setBundle basename="ae.gov.cpc.toolbar.scan.nl.ScanBundle" />
		<% 	
		}else{
		%>	
		<fmt:setLocale value="ar_AR"/>
		<fmt:setBundle basename="ae.gov.cpc.toolbar.scan.nl.ScanBundle_ar" />	
		<% 		
		}
		%>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7, IE=EmulateIE9, IE=EDGE" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<script src="WebViewerResources/jquery-1.7.1.min.js" type="text/javascript"></script>
		<link href="WebViewerResources/jquery-ui-1.8.14.custom.css" rel="stylesheet" type="text/css" />
		<script src="WebViewerResources/jquery.easing.1.3.js" type="text/javascript"></script>
		<script src="WebViewerResources/jquery-ui-1.8.14.custom.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="Resources/dynamsoft.webtwain.initiate.js"></script>
		<script type="text/javascript" src="Resources/dynamsoft.webtwain.config.js"></script>
		<script type="text/javascript" src="Resources/addon/dynamsoft.webtwain.addon.pdf.js"></script>
		<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Base Styles */
        html {
            font-size: 16px;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Tahoma, Arial, sans-serif;
        }

        /* ============================================ */
        /* TAILWIND-LIKE UTILITY CLASSES */
        /* ============================================ */

        /* Display & Layout */
        .flex {
            display: flex;
        }

        .inline-flex {
            display: inline-flex;
        }

        .block {
            display: block;
        }

        .inline-block {
            display: inline-block;
        }

        .grid {
            display: grid;
        }

        .hidden {
            display: none;
        }

        /* Flex Direction */
        .flex-row {
            flex-direction: row;
        }

        .flex-col {
            flex-direction: column;
        }

        .flex-wrap {
            flex-wrap: wrap;
        }

        .flex-nowrap {
            flex-wrap: nowrap;
        }

        /* Flex Alignment */
        .items-start {
            align-items: flex-start;
        }

        .items-end {
            align-items: flex-end;
        }

        .items-center {
            align-items: center;
        }

        .items-baseline {
            align-items: baseline;
        }

        .items-stretch {
            align-items: stretch;
        }

        .justify-start {
            justify-content: flex-start;
        }

        .justify-end {
            justify-content: flex-end;
        }

        .justify-center {
            justify-content: center;
        }

        .justify-between {
            justify-content: space-between;
        }

        .justify-around {
            justify-content: space-around;
        }

        .justify-evenly {
            justify-content: space-evenly;
        }

        .gap-1 {
            gap: 0.25rem;
        }

        .gap-2 {
            gap: 0.5rem;
        }

        .gap-3 {
            gap: 0.75rem;
        }

        .gap-4 {
            gap: 1rem;
        }

        .gap-5 {
            gap: 1.25rem;
        }

        .gap-6 {
            gap: 1.5rem;
        }

        .gap-8 {
            gap: 2rem;
        }

        .gap-10 {
            gap: 2.5rem;
        }

        /* Grid */
        .grid-cols-1 {
            grid-template-columns: repeat(1, minmax(0, 1fr));
        }

        .grid-cols-2 {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .grid-cols-3 {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }

        .grid-cols-4 {
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }

        .grid-cols-6 {
            grid-template-columns: repeat(6, minmax(0, 1fr));
        }

        .col-span-1 {
            grid-column: span 1 / span 1;
        }

        .col-span-2 {
            grid-column: span 2 / span 2;
        }

        .col-span-3 {
            grid-column: span 3 / span 3;
        }

        .col-span-full {
            grid-column: 1 / -1;
        }

        /* Flex Grow/Shrink */
        .flex-1 {
            flex: 1 1 0%;
        }

        .flex-auto {
            flex: 1 1 auto;
        }

        .flex-none {
            flex: none;
        }

        .flex-grow {
            flex-grow: 1;
        }

        .flex-shrink {
            flex-shrink: 1;
        }

        /* Width */
        .w-full {
            width: 100%;
        }

        .w-1\/2 {
            width: 50%;
        }

        .w-1\/3 {
            width: 33.333333%;
        }

        .w-1\/4 {
            width: 25%;
        }

        .w-1\/5 {
            width: 20%;
        }

        .w-auto {
            width: auto;
        }

        .w-fit {
            width: fit-content;
        }

        .w-screen {
            width: 100vw;
        }

        /* Height */
        .h-full {
            height: 100%;
        }

        .h-screen {
            height: 100vh;
        }

        .h-auto {
            height: auto;
        }

        /* Min/Max */
        .min-h-full {
            min-height: 100%;
        }

        .min-h-screen {
            min-height: 100vh;
        }

        .max-h-full {
            max-height: 100%;
        }

        .max-h-screen {
            max-height: 100vh;
        }

        .max-w-full {
            max-width: 100%;
        }

        /* Overflow */
        .overflow-auto {
            overflow: auto;
        }

        .overflow-hidden {
            overflow: hidden;
        }

        .overflow-x-auto {
            overflow-x: auto;
        }

        .overflow-y-auto {
            overflow-y: auto;
        }

        /* Padding */
        .p-0 {
            padding: 0;
        }

        .p-1 {
            padding: 0.25rem;
        }

        .p-2 {
            padding: 0.5rem;
        }

        .p-3 {
            padding: 0.75rem;
        }

        .p-4 {
            padding: 1rem;
        }

        .p-5 {
            padding: 1.25rem;
        }

        .p-6 {
            padding: 1.5rem;
        }

        .p-8 {
            padding: 2rem;
        }

        .p-10 {
            padding: 2.5rem;
        }

        .px-2 {
            padding-left: 0.5rem;
            padding-right: 0.5rem;
        }

        .px-3 {
            padding-left: 0.75rem;
            padding-right: 0.75rem;
        }

        .px-4 {
            padding-left: 1rem;
            padding-right: 1rem;
        }

        .px-6 {
            padding-left: 1.5rem;
            padding-right: 1.5rem;
        }

        .py-2 {
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
        }

        .py-3 {
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
        }

        .py-4 {
            padding-top: 1rem;
            padding-bottom: 1rem;
        }

        .py-6 {
            padding-top: 1.5rem;
            padding-bottom: 1.5rem;
        }

        .pt-0 {
            padding-top: 0;
        }

        .pt-2 {
            padding-top: 0.5rem;
        }

        .pt-3 {
            padding-top: 0.75rem;
        }

        .pb-0 {
            padding-bottom: 0;
        }

        .pb-2 {
            padding-bottom: 0.5rem;
        }

        .pb-3 {
            padding-bottom: 0.75rem;
        }

        /* Margin */
        .m-0 {
            margin: 0;
        }

        .m-1 {
            margin: 0.25rem;
        }

        .m-2 {
            margin: 0.5rem;
        }

        .m-3 {
            margin: 0.75rem;
        }

        .m-4 {
            margin: 1rem;
        }

        .m-5 {
            margin: 1.25rem;
        }

        .m-6 {
            margin: 1.5rem;
        }

        .m-8 {
            margin: 2rem;
        }

        .m-auto {
            margin: auto;
        }

        .mx-auto {
            margin-left: auto;
            margin-right: auto;
        }

        .mx-2 {
            margin-left: 0.5rem;
            margin-right: 0.5rem;
        }

        .mx-3 {
            margin-left: 0.75rem;
            margin-right: 0.75rem;
        }

        .mx-4 {
            margin-left: 1rem;
            margin-right: 1rem;
        }

        .my-2 {
            margin-top: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .my-3 {
            margin-top: 0.75rem;
            margin-bottom: 0.75rem;
        }

        .my-4 {
            margin-top: 1rem;
            margin-bottom: 1rem;
        }

        .my-5 {
            margin-top: 1.25rem;
            margin-bottom: 1.25rem;
        }

        .my-6 {
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .mt-0 {
            margin-top: 0;
        }

        .mt-2 {
            margin-top: 0.5rem;
        }

        .mt-4 {
            margin-top: 1rem;
        }

        .mb-0 {
            margin-bottom: 0;
        }

        .mb-2 {
            margin-bottom: 0.5rem;
        }

        .mb-4 {
            margin-bottom: 1rem;
        }

        /* Text Alignment */
        .text-left {
            text-align: left;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        /* Text Direction (RTL Support) */
        .ltr {
            direction: ltr;
        }

        .rtl {
            direction: rtl;
        }

        /* Text Size */
        .text-xs {
            font-size: 0.75rem;
        }

        .text-sm {
            font-size: 0.875rem;
        }

        .text-base {
            font-size: 1rem;
        }

        .text-lg {
            font-size: 1.125rem;
        }

        .text-xl {
            font-size: 1.25rem;
        }

        .text-2xl {
            font-size: 1.5rem;
        }

        .text-3xl {
            font-size: 1.875rem;
        }

        .text-4xl {
            font-size: 2.25rem;
        }

        /* Font Weight */
        .font-light {
            font-weight: 300;
        }

        .font-normal {
            font-weight: 400;
        }

        .font-medium {
            font-weight: 500;
        }

        .font-semibold {
            font-weight: 600;
        }

        .font-bold {
            font-weight: 700;
        }

        /* Colors - Text */
        .text-gray-400 {
            color: #9ca3af;
        }

        .text-gray-600 {
            color: #4b5563;
        }

        .text-gray-700 {
            color: #374151;
        }

        .text-gray-800 {
            color: #1f2937;
        }

        .text-gray-900 {
            color: #111827;
        }

        .text-white {
            color: #ffffff;
        }

        .text-blue-600 {
            color: #2563eb;
        }

        .text-blue-700 {
            color: #1d4ed8;
        }

        .text-red-600 {
            color: #dc2626;
        }

        /* Colors - Background */
        .bg-white {
            background-color: #ffffff;
        }

        .bg-gray-50 {
            background-color: #f9fafb;
        }

        .bg-gray-100 {
            background-color: #f3f4f6;
        }

        .bg-gray-200 {
            background-color: #e5e7eb;
        }

        .bg-gray-300 {
            background-color: #d1d5db;
        }

        .bg-gray-700 {
            background-color: #374151;
        }

        .bg-blue-100 {
            background-color: #dbeafe;
        }

        .bg-blue-500 {
            background-color: #3b82f6;
        }

        .bg-blue-600 {
            background-color: #2563eb;
        }

        .bg-red-50 {
            background-color: #fef2f2;
        }

        .bg-red-600 {
            background-color: #c84444;
        }

        .bg-gray-blue {
            background-color: #e8eef7;
        }

        /* Colors - Border */
        .border-gray-200 {
            border-color: #e5e7eb;
        }

        .border-gray-300 {
            border-color: #d1d5db;
        }

        .border-gray-400 {
            border-color: #9ca3af;
        }

        /* Border */
        .border {
            border: 1px solid #e5e7eb;
        }

        .border-0 {
            border: none;
        }

        .border-t {
            border-top: 1px solid #e5e7eb;
        }

        .border-b {
            border-bottom: 1px solid #e5e7eb;
        }

        .border-l {
            border-left: 1px solid #e5e7eb;
        }

        .border-r {
            border-right: 1px solid #e5e7eb;
        }

        /* Rounded Corners */
        .rounded-none {
            border-radius: 0;
        }

        .rounded-sm {
            border-radius: 0.125rem;
        }

        .rounded {
            border-radius: 0.25rem;
        }

        .rounded-md {
            border-radius: 0.375rem;
        }

        .rounded-lg {
            border-radius: 0.5rem;
        }

        .rounded-full {
            border-radius: 9999px;
        }

        /* Shadow */
        .shadow-none {
            box-shadow: none;
        }

        .shadow-sm {
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }

        .shadow {
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
        }

        .shadow-md {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .shadow-lg {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        /* Input & Form */
        .input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            font-size: 1rem;
            background-color: #ffffff;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .input:disabled {
            background-color: #f3f4f6;
            color: #9ca3af;
            cursor: not-allowed;
        }

        select.input {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23111827' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: left 1rem center;
            padding-right: 1rem;
            padding-left: 2.5rem;
        }

        /* Label */
        .label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        /* Form Group replacement: utility-based floating label wrapper */
        .relative {
            position: relative;
        }

        .float-wrapper {
            position: relative;
            padding-top: 0.75rem;
        }


        .float-label {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            transition: all 0.16s ease;
            background: var(--color-bg, #ffffff);
            padding: 0 0.375rem;
            color: var(--muted, #9ca3af);
            font-size: 0.875rem;
            pointer-events: none;
            margin: 0;
        }

        .float-wrapper:focus-within .float-label,
        .float-wrapper select.input:focus~.float-label,
        .float-wrapper select.input:valid~.float-label,
		.float-wrapper input.input:not(:placeholder-shown)~.float-label,
		.float-wrapper textarea.input:not(:placeholder-shown)~.float-label {
            top: 0.375rem;
            transform: none;
            font-size: 0.75rem;
        }

        /* Button */
        .btn {
            padding: 0.875rem 1.5rem;
            border: none;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            background-color: #374151;
            color: #ffffff;
        }

        .btn-primary:hover {
            background-color: #1f2937;
        }

        .btn-secondary {
            background-color: #e5e7eb;
            color: #374151;
        }

        .btn-secondary:hover {
            background-color: #d1d5db;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.75rem;
        }

        .btn-md {
            padding: 0.75rem 1.5rem;
            font-size: 0.875rem;
        }

        .btn-lg {
            padding: 1rem 2rem;
            font-size: 1rem;
        }

        .btn-full {
            width: 100%;
        }

        /* Responsive Utilities - Mobile First Approach */
        /* Small screens and up (640px+) */
        @media (min-width: 640px) {
            .sm\:block {
                display: block;
            }

            .sm\:hidden {
                display: none;
            }

            .sm\:flex {
                display: flex;
            }

            .sm\:flex-col {
                flex-direction: column;
            }

            .sm\:flex-row {
                flex-direction: row;
            }

            .sm\:w-full {
                width: 100%;
            }

            .sm\:p-2 {
                padding: 0.5rem;
            }

            .sm\:p-3 {
                padding: 0.75rem;
            }

            .sm\:p-4 {
                padding: 1rem;
            }

            .sm\:gap-2 {
                gap: 0.5rem;
            }

            .sm\:gap-3 {
                gap: 0.75rem;
            }

            .sm\:gap-4 {
                gap: 1rem;
            }

            .sm\:m-2 {
                margin: 0.5rem;
            }

            .sm\:m-4 {
                margin: 1rem;
            }

            .sm\:grid-cols-1 {
                grid-template-columns: repeat(1, minmax(0, 1fr));
            }

            .sm\:text-sm {
                font-size: 0.875rem;
            }

            .sm\:text-base {
                font-size: 1rem;
            }
        }

        /* Medium screens and up (768px+) */
        @media (min-width: 768px) {
            .md\:block {
                display: block;
            }

            .md\:hidden {
                display: none;
            }

            .md\:flex {
                display: flex;
            }

            .md\:flex-row {
                flex-direction: row;
            }

            .md\:flex-col {
                flex-direction: column;
            }

            .md\:w-1/2 {
                width: 50%;
            }

            .md\:grid-cols-1 {
                grid-template-columns: repeat(1, minmax(0, 1fr));
            }

            .md\:grid-cols-2 {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .md\:grid-cols-3 {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }

            .md\:gap-2 {
                gap: 0.5rem;
            }

            .md\:gap-3 {
                gap: 0.75rem;
            }

            .md\:gap-4 {
                gap: 1rem;
            }

            .md\:gap-6 {
                gap: 1.5rem;
            }

            .md\:p-2 {
                padding: 0.5rem;
            }

            .md\:p-3 {
                padding: 0.75rem;
            }

            .md\:p-4 {
                padding: 1rem;
            }

            .md\:p-6 {
                padding: 1.5rem;
            }
        }

        /* Large screens and up (1024px+) */
        @media (min-width: 1024px) {
            .lg\:block {
                display: block;
            }

            .lg\:hidden {
                display: none;
            }

            .lg\:flex {
                display: flex;
            }

            .lg\:flex-row {
                flex-direction: row;
            }

            .lg\:flex-col {
                flex-direction: column;
            }

            .lg\:w-1/2 {
                width: 50%;
            }

            .lg\:grid-cols-1 {
                grid-template-columns: repeat(1, minmax(0, 1fr));
            }

            .lg\:grid-cols-2 {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .lg\:grid-cols-3 {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }

            .lg\:gap-2 {
                gap: 0.5rem;
            }

            .lg\:gap-3 {
                gap: 0.75rem;
            }

            .lg\:gap-4 {
                gap: 1rem;
            }

            .lg\:gap-6 {
                gap: 1.5rem;
            }

            .lg\:p-2 {
                padding: 0.5rem;
            }

            .lg\:p-3 {
                padding: 0.75rem;
            }

            .lg\:p-4 {
                padding: 1rem;
            }

            .lg\:p-6 {
                padding: 1.5rem;
            }

            .lg\:p-8 {
                padding: 2rem;
            }
        }

        /* Input size utilities */
        .input-sm {
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
        }

        .input-md {
            padding: 0.75rem 1rem;
            font-size: 1rem;
        }

        .input-lg {
            padding: 1rem 1.25rem;
            font-size: 1.125rem;
        }

        /* Basic utility wrappers for inputs/labels using tailwind-like classes */
        .input {
            display: block;
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            background-color: #ffffff;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
            font-size: 1rem;
        }

        .input:focus {
            outline: none;
            border-color: var(--color-primary-600, #2563eb);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
        }

        .label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        /* Color & theme variables */
        :root {
            --color-primary: #3b82f6;
            --color-primary-600: #2563eb;
            --color-primary-700: #1d4ed8;
            --color-accent: #c84444;
            --color-bg: #ffffff;
            --color-surface: #f3f4f6;
            --text-default: #111827;
            --muted: #9ca3af;
        }

        /* dtheme (dark / alternate theme) - toggle by adding `.dtheme` on body */
        .dtheme {
            --color-primary: #60a5fa;
            --color-primary-600: #3b82f6;
            --color-primary-700: #1e40af;
            --color-accent: #f87171;
            --color-bg: #0b1220;
            --color-surface: #0f1724;
            --text-default: #e6eef8;
            --muted: #9ca3af;
        }

        /* Background utilities using theme vars */
        .bg-primary {
            background-color: var(--color-primary);
        }

        .bg-surface {
            background-color: var(--color-surface);
        }

        .bg-theme {
            background-color: var(--color-bg);
        }

        /* Text color utilities */
        .text-primary {
            color: var(--color-primary);
        }

        .text-muted {
            color: var(--muted);
        }

        .text-theme {
            color: var(--text-default);
        }

        /* Border color utilities */
        .border-primary {
            border-color: var(--color-primary-600);
        }

        /* Ring utilities (focus outlines) */
        .ring {
            box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.04);
        }

        .ring-1 {
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.06);
        }

        /* focus: variant helpers (use class name exactly as used in HTML: e.g. `focus:ring-primary`) */
        .focus\:ring-primary:focus {
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.12);
            border-color: var(--color-primary-600);
        }

        .focus\:ring-accent:focus {
            box-shadow: 0 0 0 4px rgba(200, 68, 68, 0.12);
            border-color: var(--color-accent);
        }

        /* Responsive input size utilities (md:) */
        @media (min-width: 768px) {
            .md\:input-sm {
                padding: 0.5rem 0.75rem;
                font-size: 0.875rem;
            }

            .md\:input-md {
                padding: 0.75rem 1rem;
                font-size: 1rem;
            }

            .md\:input-lg {
                padding: 1rem 1.25rem;
                font-size: 1.125rem;
            }
        }

        /* Additional size utilities */
        .w-4 {
            width: 1rem;
        }

        .w-8 {
            width: 2rem;
        }

        .w-16 {
            width: 4rem;
        }

        .w-20 {
            width: 5rem;
        }

        .w-24 {
            width: 6rem;
        }

        .w-28 {
            width: 7rem;
        }

        .h-4 {
            height: 1rem;
        }

        .h-6 {
            height: 1.5rem;
        }

        .h-8 {
            height: 2rem;
        }

        .h-16 {
            height: 4rem;
        }

        /* Max width utils */
        .max-w-sm {
            max-width: 24rem;
        }

        .max-w-md {
            max-width: 28rem;
        }

        /* Typography extras */
        .leading-none {
            line-height: 1;
        }

        .leading-tight {
            line-height: 1.25;
        }

        .leading-normal {
            line-height: 1.5;
        }

        .uppercase {
            text-transform: uppercase;
        }

        .lowercase {
            text-transform: lowercase;
        }

        .capitalize {
            text-transform: capitalize;
        }

        /* Utility shorthand for common text sizes */
        .text-xxs {
            font-size: 0.625rem;
        }

        .text-xs {
            font-size: 0.75rem;
        }

        .text-sm {
            font-size: 0.875rem;
        }

        .text-base {
            font-size: 1rem;
        }

        .text-lg {
            font-size: 1.125rem;
        }

        .text-xl {
            font-size: 1.25rem;
        }

        /* Spacing helpers additional */
        .space-x-2>*+* {			
            margin-left: 0.5rem;
        }
		
		.rtl .space-x-2>*+* {
			margin-right: 0.5rem;
			margin-left: 0;
		}

        .space-x-3>*+* {
            margin-left: 0.75rem;
        }

        .space-y-2>*+* {
            margin-top: 0.5rem;
        }
  
        .space-y-3>*+* {
            margin-top: 0.75rem;
        }
        .space-y-4>*+* {
            margin-top: 1rem;
        }
        .space-y-5>*+* {
            margin-top: 1.25rem;
        }
        .space-y-6>*+* {
            margin-top: 1.5rem;
        }

        /* Custom Dropdown Styles */
        .custom-dropdown {
            position: relative;
            width: 100%;
        }

        .custom-dropdown-input {
            width: 100%;
            cursor: pointer;
        }

        .custom-dropdown-list {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            list-style: none;
            margin: 0.25rem 0 0 0;
            padding: 0;
            display: none;
            max-height: 250px;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .custom-dropdown-list.open {
            display: block;
        }

        .custom-dropdown-item {
            padding: 0.75rem 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border-bottom: 1px solid #e5e7eb;
        }

        .custom-dropdown-item:hover {
            background-color: #f3f4f6;
        }

        .custom-dropdown-item.selected {
            background-color: #dbeafe;
            color: #0284c7;
            font-weight: 500;
        }

        .custom-dropdown-item:last-child {
            border-bottom: none;
        }

        /* RTL Support for Dropdown */
        [dir="rtl"] .custom-dropdown-list {
            right: 0;
            left: 0;
        }

        [dir="rtl"] .custom-dropdown-item {
            text-align: right;
        }

        /* Multi-Select with Chips Styles */
        .multi-select-input {
            display: flex;
            flex-wrap: wrap;
            gap: 0.375rem;
            padding: 0.375rem 0.75rem;
            min-height: 2.5rem;
            width: 100%;
            align-items: center;
        }

        .chip {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background-color: #dbeafe;
            color: #0284c7;
            padding: 0.375rem 0.75rem;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            white-space: nowrap;
        }

        .chip-remove {
            cursor: pointer;
            font-weight: bold;
            user-select: none;
            transition: opacity 0.2s ease;
        }

        .chip-remove:hover {
            opacity: 0.6;
        }

        .multi-select-list {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            list-style: none;
            margin: 0.25rem 0 0 0;
            padding: 0;
            display: none;
            max-height: 250px;
            overflow-y: auto;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .multi-select-list.open {
            display: block;
        }

        .multi-select-item {
            padding: 0.75rem 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .multi-select-item:hover {
            background-color: #f3f4f6;
        }

        .multi-select-item input[type="checkbox"] {
            cursor: pointer;
        }

        .multi-select-item.selected {
            background-color: #f0f9ff;
        }

        .multi-select-item:last-child {
            border-bottom: none;
        }

        /* RTL Support for Multi-Select */
        [dir="rtl"] .multi-select-list {
            right: 0;
            left: 0;
        }

        [dir="rtl"] .multi-select-item {
            flex-direction: row-reverse;
        }

        [dir="rtl"] .chip {
            flex-direction: row-reverse;
        }
    </style>

		<title>
			<fmt:message key="label.header" />
		</title>
			   
		<fmt:message key="label.document" var="docPrefix" scope="session" />
		<% 
		Object initialDocNameObj = request.getSession().getAttribute("docOrder");
		String initialDocName = session.getAttribute("docPrefix").toString();
		if (initialDocNameObj != null){
			initialDocName += (" " +  initialDocNameObj.toString());
		}

		//String localLang = request.getLocale().getLanguage().toLowerCase();
		String localLang = request.getParameter("language").toLowerCase();

		String dir = localLang.startsWith("ar") ? "rtl" : "ltr";
		String textAlignment = localLang.startsWith("ar") ? "right" : "left";
		%>
	</head>
	
	<body class="bg-gray-50 h-screen <%=dir%>" onload="fillDocName();">
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUIMTk5OTM1NDRkZKab+MSgWdzJEIo9NSpUQywEnlJM" />
		
		<div class="flex flex-1 flex-row h-full w-full max-h-full overflow-auto">
			<div class="flex-1 flex-col max-h-full overflow-y-auto p-2">
				<div class="grid grid-cols-1 space-y-4" >
					<!-- <div >
					   
						 Locale: <c:out value="${pageContext.request.locale.language}" />_<c:out value="${pageContext.request.locale.country}" /> 
						 </div> --> 
						<!-- align="<%=textAlignment%>" -->
					<!-- Header -->
					<div class="border-b pb-2">
						<h1 class="text-lg font-bold text-gray-900"><fmt:message key="label.scanAndAddFiles" /></h1>
					</div>
					
					
					<div class="grid grid-cols-1 space-y-2">
						
						<!-- document type -->
						<div class="float-wrapper relative">
							<!-- id="selectDocTypeList" -->
							<input id="docTypeList" type="text" placeholder="" class="input input-md custom-dropdown-input"  onchange="setDocName(this);" readonly />
							<input id="docType" type="hidden" name="docType" value="${docType.key}">
							<ul id="docTypeDL" class="custom-dropdown-list" dir="rtl">
								<c:forEach var="docType" items="${sessionScope.docTypes}">						 
									<c:if test="${!docType.isParent}">
										<li class="custom-dropdown-item" data-value="${docType.value}" data-id="${docType.key}" dir="ltr">${docType.value}</li>
									</c:if>
								</c:forEach>
							</ul>
							<label for="docTypeList" class="label float-label"><fmt:message key="label.selectDocType" /></label>
						</div>
						
						<!-- Document Name -->
						<div class="float-wrapper relative">
							<input class="input input-md" type="text" name="documentName" id="documentName" placeholder="" />
							<label class="label float-label" for="documentName"><fmt:message key="label.documentName" /> </label> 
						</div>

						<!-- Request -->
						<div class="float-wrapper relative">														
							<!-- id="selectRequestList" -->
							<input id="personRequestList" type="text" placeholder="" class="input input-md custom-dropdown-input" readonly />
							<input id="personRequest" type="hidden" name="selectRequestList">
							<ul id="personRequestDataList" class="custom-dropdown-list" dir="rtl">								
								<c:forEach var="personRequest" items="${sessionScope.personRequests}">
									<li class="custom-dropdown-item" data-value="${personRequest.value}" data-id="${personRequest.key}" dir="rtl">${personRequest.value}</li>
								</c:forEach>
							</ul>
							<label for="personRequestList" class="label float-label" ><fmt:message key="label.selectRequest" /></label>
						</div>

						<div class="border-b p-2">
							<h1 class="text-lg font-bold" ><fmt:message key="label.settings" /></h1>
						</div>

						<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 space-x-2">
							<!-- Upload file format -->
							<div class="float-wrapper relative">								
								<select id="uploadFileFormat" name="ImageType" class="input input-md" onchange="rdPDF_onclick(this);" >
									<option value="pdf">PDF</option>
									<option value="tiff">TIFF</option>
									<option value="jpg">JPG</option>
								</select>
								<label for="uploadFileFormat" class="label float-label"><fmt:message key="label.fileFormat" /></label>
							</div>

							<!-- Pixel Type -->
							<div class="float-wrapper relative">								
								<select id="pixelType" name="pixelType" class="input input-md">
									<option value="2"><fmt:message key="label.colored" /></option>
									<option value="1"><fmt:message key="label.gray" /></option>
									<option value="0"><fmt:message key="label.notColored" /></option>
								</select>
								<label for="pixelType" class="label float-label"><fmt:message key="label.pixelType" /></label>
							</div>
						</div>

						<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 space-x-2">
							<!-- Show UI , Auto Feeder , Duplex -->
							<div class="float-wrapper relative">								
								<div id="scanAsWrapper" class="multi-select-input input input-md" tabindex="0">
									<!-- Chips will be inserted here by JavaScript -->
								</div>
								<input id="scanAsHidden" type="hidden" name="autoFeeder">
								<ul id="scanAsList" class="multi-select-list">
									<li class="multi-select-item" data-value="autoFeeders">
										<input type="checkbox" id="scanAs-autoFeeders" value="autoFeeders">
										<label for="scanAs-autoFeeders"><fmt:message key="label.autoFeeders" /></label>
									</li>
									<li class="multi-select-item" data-value="showUI">
										<input type="checkbox" id="scanAs-showUI" value="showUI">
										<label for="scanAs-showUI"><fmt:message key="label.showUI" /></label>
									</li>
									<li class="multi-select-item" data-value="bothSides">
										<input type="checkbox" id="scanAs-bothSides" value="bothSides">
										<label for="scanAs-bothSides"><fmt:message key="label.bothSides" /></label>
									</li>
								</ul>
								<label for="scanAsWrapper" class="label float-label"><fmt:message key="label.scanAs" /></label>
							</div>

							<!-- Save As -->
							<div class="float-wrapper relative">								
								<select id="saveAs" class="input input-md">
									<option value="onepdf"><fmt:message key="label.oneFile" /></option>
									<option value="multipdf">
										&nbsp;<fmt:message key="label.multibleFiles" />
										<span id="numberOfPages"></span> <fmt:message key="label.multibleFiles1" />
									</option>
								</select>
								<label for="saveAs" class="label float-label"><fmt:message key="label.saveAs" /></label>
							</div>
						</div>
						
						<div class="float-wrapper relative">
							<select id="source" class="input input-md" ></select>
							<label for="source" class="label float-label" ><fmt:message key="label.selectScanner" /></label> 
						</div>
						
						<div class="grid grid-cols-3 space-x-2" style="display:none;">
							<div>
								<p id="demo1"><fmt:message key="label.numberOfPages" /> </p>
							</div>
							
							<div>	   
								 <p id="demo3"></p>
							</div>
							
							<div>
								<p id="demo2"></p>
							</div>  
						</div>
						
						<!-- Hidden Value - Not Used -->
						<div class="mt-2" style="display:none">
							<div>
								<label>Script Language :</label>
								<select size="1" id="ddlLanguages" class="w60p fr" onchange="languageSelected();"></select>
								<div id="tipInfo">
									<p>Make sure your server supports the language you choose!</p>
								</div>
							</div>
						</div>
					</div>
										
					<div class="grid grid-cols-1 space-y-2">
						<div class="grid grid-cols-3 space-x-2">					 
							<!-- style="background: #9F845B;    width: 110px;height: 34px;font-family: JannaLT-Bold;font-size: 17.5px;color: #FFFFFF;border: none;" -->
							<input class="btn btn-secondary" type="button" title=<fmt:message key="btn.scan" />  value=<fmt:message key="btn.scan" /> onclick="AcquireImage();" />
							<input class="btn btn-secondary" type="button" title=<fmt:message key="label.openLocalFile" /> value=<fmt:message key="label.openLocalFile" /> onclick="LoadImages();"  />
							<input class="btn btn-secondary" type="button"  title=<fmt:message key="label.edit" /> value=<fmt:message key="label.edit" /> onclick="ShowImageEditor();"/>
						</div>
						
						<input class="btn btn-primary btn-full" id="upload" title=<fmt:message key="label.upload" /> disabled type="button" value=<fmt:message key="label.upload" /> onclick="upload();" />						
						
					</div>

				</div>						
			</div>
					
			<div class="flex-1 flex-col h-full w-full max-h-full max-w-full overflow-y-auto" >
				<!-- dwtcontrolContainer is the default div id for Dynamic Web TWAIN control.
			 If you need to rename the id, you should also change the id in the dynamsoft.webtwain.config.js accordingly. -->
				<div id="dwtcontrolContainer"></div>
			</div>
		</div>

		<script>
			function getPixelTypeSelect(){
				return document.getElementById("pixelType");
			}
			
			
			function getPixelTypeSelectOptions(){
				return getPixelTypeSelect().options;
			}
			
			function setPixelTypeBW(checked, disabled){
				if(checked){
					checked = false;
				}
				
				if(disabled) {
					disabled = false;
				}
				
				const options = getPixelTypeSelectOptions();
				for (let i = 0; i < options.length; i++){
					if(options[i].value == 0){
						options[i].disabled = disabled;
						options[i].selected = checked;
						break;
					}
				}
			}
			
			function getPixelTypeValues(){
				return getPixelTypeSelect().value
			}

			function isPixelTypeBw(){
				return getPixelTypeValues() == 0;
			}
			
			function getSaveAsSelectEle(){
				return document.getElementById("saveAs");
			}
			
			function getSaveAsSelectOptions(){
				return getSaveAsSelectEle().options;
			}
			
			function setOnePdfOption(disabled, selected){
				const options = getSaveAsSelectOptions();
				for(let i = 0; i < options.length; i++){
					if(options[i].value == "onepdf"){
						options[i].disabled = disabled;
						options[i].selected = selected;
						break;
					}
				}
			}
			
			function setMultipdfOption(disabled, selected){
				const options = getSaveAsSelectOptions();
				for(let i = 0; i < options.length; i++){
					if(options[i].value == "multipdf"){
						options[i].disabled = disabled;
						options[i].selected = selected;
						break;
					}
				}
			}

			var uploadedFormat="pdf";
			
			const docTypeInput = document.getElementById("docType");			
			const docTypeList = document.getElementById("docTypeList");
			const docTypeDL = document.getElementById("docTypeDL");
			
			const personRequest = document.getElementById("personRequest");
			const personRequestsList = document.getElementById("personRequestList");
			const personRequestDL = document.getElementById("personRequestDataList");

			// Custom Dropdown Handler Function
			function setupCustomDropdown(inputElement, dropdownList) {
				// Click handler for input to toggle dropdown
				inputElement.addEventListener("click", function(e) {
					e.stopPropagation();
					dropdownList.classList.toggle("open");
				});

				// Handle dropdown item selection
				const items = dropdownList.querySelectorAll(".custom-dropdown-item");
				items.forEach(item => {
					item.addEventListener("click", function(e) {
						e.stopPropagation();
						
						// Remove previous selection
						items.forEach(i => i.classList.remove("selected"));
						
						// Mark current as selected
						this.classList.add("selected");
						
						// Set input value
						inputElement.value = this.getAttribute("data-value");
						
						// Close dropdown
						dropdownList.classList.remove("open");
						
						// Trigger change event
						inputElement.dispatchEvent(new Event("change", { bubbles: true }));
					});
				});

				// Close dropdown when clicking outside
				document.addEventListener("click", function(e) {
					if (!inputElement.contains(e.target) && !dropdownList.contains(e.target)) {
						dropdownList.classList.remove("open");
					}
				});
			}

			// Initialize custom dropdowns
			setupCustomDropdown(docTypeList, docTypeDL);
			setupCustomDropdown(personRequestsList, personRequestDL);

			// Handle docType selection
			docTypeList.addEventListener("change", function(){
				console.group("docTypeList change event");
				docTypeInput.value = "";

				const selectedValue = this.value;
				console.log("selectedValue", selectedValue);
				
				const items = docTypeDL.querySelectorAll(".custom-dropdown-item");
				for(let i = 0; i < items.length; i++){
					const selectedItem = items[i];
					
					if(selectedItem.getAttribute("data-value") == selectedValue){
						console.log("selectedItem", selectedItem);
						docTypeInput.value = selectedItem.getAttribute("data-id");
						break;
					}
				}
				
				console.log("docTypeInput.value", docTypeInput.value);
				console.groupEnd();
			})
			
			// Handle personRequest selection
			personRequestsList.addEventListener("change", function(){
				console.group("personRequestList change event");
				const selectedValue = personRequestsList.value;
				console.log("selectedValue", selectedValue);
				
				const items = personRequestDL.querySelectorAll(".custom-dropdown-item");
				for(let i = 0; i < items.length; i++){
					const item = items[i];
					
					if(item.getAttribute("data-value") == selectedValue){
						console.log("value", item);
						personRequest.value = item.getAttribute("data-id");
						break;
					}
				}
				console.log("personRequest.value", personRequest.value)
				console.groupEnd();
			});
			
			// Multi-Select Handler for scanAs
			const scanAsWrapper = document.getElementById("scanAsWrapper");
			const scanAsHidden = document.getElementById("scanAsHidden");
			const scanAsList = document.getElementById("scanAsList");
			const scanAsCheckboxes = scanAsList.querySelectorAll("input[type='checkbox']");
			const scanAsItems = scanAsList.querySelectorAll(".multi-select-item");

			// Function to update chips display
			function updateScanAsChips() {
				const selectedValues = [];
				scanAsCheckboxes.forEach(checkbox => {
					if (checkbox.checked) {
						selectedValues.push(checkbox.value);
					}
				});

				// Update hidden input with selected values
				scanAsHidden.value = selectedValues.join(",");

				// Clear existing chips
				const existingChips = scanAsWrapper.querySelectorAll(".chip");
				existingChips.forEach(chip => chip.remove());

				// Add new chips
				selectedValues.forEach(value => {
					const checkbox = document.getElementById(`scanAs-${value}`);
					const label = checkbox.nextElementSibling;
					const labelText = label.textContent;

					const chip = document.createElement("div");
					chip.className = "chip";
					chip.innerHTML = `
						${labelText}
						<span class="chip-remove" data-value="${value}">×</span>
					`;

					// Add remove handler
					chip.querySelector(".chip-remove").addEventListener("click", function(e) {
						e.stopPropagation();
						checkbox.checked = false;
						updateScanAsChips();
						// Update item UI
						scanAsItems.forEach(item => {
							if (item.getAttribute("data-value") === value) {
								item.classList.remove("selected");
							}
						});
					});

					scanAsWrapper.appendChild(chip);
				});
			}

			// Handle checkbox changes
			scanAsCheckboxes.forEach(checkbox => {
				checkbox.addEventListener("change", function() {
					const itemValue = this.value;
					const item = scanAsList.querySelector(`[data-value="${itemValue}"]`);
					
					if (this.checked) {
						item.classList.add("selected");
					} else {
						item.classList.remove("selected");
					}
					
					updateScanAsChips();
				});
			});

			// Show list on focus
			scanAsWrapper.addEventListener("focus", function() {
				scanAsList.classList.add("open");
			});

			// Hide list on blur
			scanAsWrapper.addEventListener("blur", function(e) {
				// Check if focus is going to the list or checkbox
				setTimeout(() => {
					if (!scanAsList.contains(document.activeElement) && !scanAsWrapper.contains(document.activeElement)) {
						scanAsList.classList.remove("open");
					}
				}, 100);
			});

			// Prevent blur when clicking on list items
			scanAsList.addEventListener("mousedown", function(e) {
				e.preventDefault();
				if (e.target.tagName === "INPUT") {
					e.target.checked = !e.target.checked;
					e.target.dispatchEvent(new Event("change", { bubbles: true }));
				}
			});

			// Close list when clicking outside
			document.addEventListener("click", function(e) {
				if (!scanAsWrapper.contains(e.target) && !scanAsList.contains(e.target)) {
					scanAsList.classList.remove("open");
				}
			});
			
			function getDocTypeLabel(){
				//const e = document.getElementById("selectDocTypeList");
				//console.log("e", e);
				//return e.value;
				return docTypeList.value;
			}
			
			function fillDocName(){
				console.group("ScanDocument.jsp:script:functions:fillDocName");
				// const e = document.getElementById("selectDocTypeList");
				// const strUser = e.options[e.selectedIndex].text;
				const strUser = getDocTypeLabel();
				console.log("strUser", strUser)
				document.getElementById("documentName").value = strUser;
				console.groupEnd();
			}
			
			function setDocName(obj){
				console.group("setDocName", obj)
				console.log("obj.value", obj.value)
				// var e = document.getElementById("selectDocTypeList");
				// var strUser = e.options[e.selectedIndex].text;
				const strUser = getDocTypeLabel();
				console.log('strUser :'+strUser);
				document.getElementById("documentName").value = strUser;
				console.groupEnd();
			}

			//************************************************************************-
			 
									//rdPDF_onclick

			//************************************************************************-->
			function rdPDF_onclick(obj){
				console.log("rdPDF_onclick", obj);
				var language = window.navigator.userLanguage || window.navigator.language;
				console.log("window.navigator.userLanguage :" + window.navigator.userLanguage);
				console.log("window.navigator.language :" + window.navigator.language);

				console.log("obj.value :" + obj.value);
				uploadedFormat = obj.value;
				
				const pixelTypeOptions = getPixelTypeSelectOptions();
				console.log("pixelTypeOptions", pixelTypeOptions);
				
				if (obj.value != null && (obj.value == 'pdf' || obj.value == 'tiff')) {
					// document.getElementById("saveAs_div").style.display = "block";
					// document.getElementById("bw_label").style.disabled = false;
					// var _chkMultiPageTIFF = document.getElementById("MultiPagePDF");
					
					// var bw = document.getElementById("bw");
					// bw.checked = false;
					// bw.disabled = false;
					setPixelTypeBW(false, false);
					console.log("save as options", getSaveAsSelectOptions());
					// _chkMultiPageTIFF.checked = false;
					// _chkMultiPageTIFF.disabled = false;
					setMultipdfOption(false, false);

					// var _chkMultiPagePDF = document.getElementById("OnepagePDF");
					// _chkMultiPagePDF.disabled = false;
					// _chkMultiPagePDF.checked = true;
					setOnePdfOption(false, true);
				} else {
					// document.getElementById("saveAs_div").style.display = "none";

					// var bw = document.getElementById("bw");
					// bw.checked = false;
					// bw.disabled = true;
					setPixelTypeBW(false, true);

					// document.getElementById("bw_label").style.disabled = true;
					// var _chkMultiPageTIFF = document.getElementById("MultiPagePDF");
					// _chkMultiPageTIFF.checked = false;
					// _chkMultiPageTIFF.disabled = true;
					setMultipdfOption(false, true);

					// var _chkMultiPagePDF = document.getElementById("OnepagePDF");
					// _chkMultiPagePDF.disabled = true;
					// _chkMultiPagePDF.checked = false;
					setOnePdfOption(true, false);
				}
			}
			//<!--************************************************************************-->
			 
											//OnSuccess


			//<!--************************************************************************-->
			function OnSuccess() {
				console.log('successful>>');
			
			}
		 
			// <!--************************************************************************-->
			 
											//OnFailure


			//<!--****************************************************************************-->
			function OnFailure(errorCode, errorString) {
				alert(errorString);
			}
			// <!--************************************************************************-->
		 
									//LoadImage


			//<!--************************************************************************-->
			function LoadImage() { 
				if (DWObject) {
					// Please NOTE that the PDF Rasterizer doesn't work for Chrome/Firefox 26
					if (DWObject.Addon.PDF.IsModuleInstalled()) {
							DWObject.Addon.PDF.SetReaderOptions({
								convertMode: Dynamsoft.DWT.EnumDWT_ConvertMode.CM_AUTO,
								renderOptions: {
									resolution: 200
								}
							});
					}
					DWObject.IfShowFileDialog = true; // Open the system's file dialog to load image
					DWObject.LoadImageEx("", Dynamsoft.DWT.EnumDWT_ImageType.IT_PDF, OnSuccess, OnFailure); // Load images in all supported formats (.bmp, .jpg, .tif, .png, .pdf). OnSuccess or OnFailure will be called after the operation

				}
			}


		 
			//<!--************************************************************************-->
			 
											//OnHttpUploadSuccess


			//<!--************************************************************************-->

			function OnHttpUploadSuccess() {
				console.log('successful..');
			
			}
			//<!--************************************************************************-->
			 
											//OnHttpUploadFailure


			//<!--************************************************************************-->
			function OnHttpUploadFailure(errorCode, errorString, sHttpResponse) {
				console.log('failed');
				alert(errorString + sHttpResponse);
			}
			//<!--************************************************************************-->
			 
												// upload

			 
			//<!--************************************************************************-->
											
			function upload() {
				console.log('uploadedFormat :'+uploadedFormat);
				console.log('DWObject.HowManyImagesInBuffer :'+DWObject.HowManyImagesInBuffer);
				console.log('document.getElementsByName("documentName") :'+document.getElementById("documentName").value);
				//<!--console.log('maxNumberofPages>> '+gOptions.maxNumberofPages);

				//<!--if( DWObject.HowManyImagesInBuffer >gOptions.maxNumberofPages && document.getElementById("MultiPagePDF").checked ){
				//<!--	 alert('اكبر عدد صفحات مسموح به '+gOptions.maxNumberofPages);
				//<!--	 return false;
				//<!--}

				if( DWObject.HowManyImagesInBuffer ==0){
				 alert('الرجاء اضافة ملف');
				 return false;
				}

				if(document.getElementById("documentName").value==null || document.getElementById("documentName").value ==''){
				 alert('الرجاء اضافة اسم ملف');
				 return false;
				}
				var  saveAs =document.getElementsByName("PDFType") ;
				console.log('saveAs :'+saveAs[0].checked);
				console.log('saveAs :'+saveAs[1].checked);
				if((uploadedFormat == 'pdf' || uploadedFormat == 'tiff') && saveAs[0].checked ==false && saveAs[1].checked==false){
				 alert('الرجاء أختيار طريقة الحفظ');
				 return false;
				}
				if (uploadedFormat == 'pdf') {
				 uploadPDF();
				} else if (uploadedFormat == 'tiff') {
				 uploadTiff();
				}
				else if (uploadedFormat == 'jpg') {
				 uploadJPG();
				}     
		   
			}
			//<!--************************************************************************-->
			 
											//uploadPDF


			//<!--************************************************************************-->
			function uploadPDF() {
				console.log(' uploadPDF..');
				console.log(' DWObject.HowManyImagesInBuffer :' + DWObject.HowManyImagesInBuffer);

				var multiPage = document.getElementById("MultiPagePDF").checked;
				var onePage = document.getElementById("OnepagePDF").checked;


				//var strHTTPServer = "vs-cpc-prod-fn1.cpc.gov.ae"; //location.hostname; //The name of the HTTP server. For example: "www.dynamsoft.com";
				var strHTTPServer = "cpcdms.ca.ccao.gov.ae";
				var CurrentPathName = unescape(location.pathname);
				var CurrentPath = CurrentPathName.substring(0, CurrentPathName.lastIndexOf("/") + 1);
				var strActionPage = "/CPCScan/Handler"; //CurrentPath + "/CPCScan/Handler";
				DWObject.IfSSL = true; // Set whether SSL is used
				//  DWObject.HTTPPort = location.port == "" ? 9080 : location.port;
				var documentType = document.getElementById("selectDocTypeList").value;
				var personRequest = document.getElementById("selectRequestList").value;
				var documentName = document.getElementById("documentName").value;
				var oneFile = document.getElementById("OnepagePDF");
				console.log(' documentName :'+documentName);
				var Digital = new Date();
				var uploadfilename = Digital.getMilliseconds(); // Uses milliseconds according to local time as the file name

				if (document.getElementById("OnepagePDF").checked == true) {
				 console.log('uploadedFormat ' + uploadedFormat);
				 strActionPage="CPCScan/FNUplaodHandler?documentType=" + documentType + "&personRequest=" + personRequest + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage;;

				 
				 DWObject.SetHTTPFormField("PDFFileName", "dd.pdf");
				 DWObject.HTTPUploadAllThroughPostAsPDF(strHTTPServer, strActionPage, documentName + ".pdf", OnHttpUploadSuccess, OnHttpUploadFailure);
				} else if (document.getElementById("MultiPagePDF").checked == true) {
				 var i = 0;

				 DWObject.ClearAllHTTPFormField(); // Clear all fields first


				 function asyncFailureFunc(errorCode, errorString) {
					 alert("ErrorCode: " + errorCode + "\r" + "ErrorString:" + errorString);
				 }
				 var convertImage = function(_index) {
					 DWObject.ConvertToBlob([_index], EnumDWT_ImageType.IT_PDF,
						 function(result) {
						 DWObject.SetHTTPFormField('image_' + _index, result, documentName+'_' + _index+".pdf");
							 i++;

							 if (i < DWObject.HowManyImagesInBuffer) {
								 convertImage(i);
							 } else {
								 console.log('call ser');
								
								 console.log('documentType :' + documentType);
								
								 
								// var url = "http://vs-cpc-prod-fn1.cpc.gov.ae:9081/CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage.checked;
								 var url = "https://cpcdms.ca.ccao.gov.ae/CPCScan/FNUplaodHandler?documentType=" + documentType + "&personRequest=" + personRequest + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage.checked;
								 DWObject.HTTPUpload(url, OnHttpUploadSuccess, OnHttpUploadFailure);
							 }
						 }, asyncFailureFunc);
				 }
				 convertImage(0);
				}
			}
			//<!--************************************************************************-->
			 
										<!--uploadTiff--

			//<!--****************************************************************************-->
			function uploadTiff() {
				console.log(' uploadTiff..');
				console.log(' DWObject.HowManyImagesInBuffer :' + DWObject.HowManyImagesInBuffer);
				//var strHTTPServer = "vs-cpc-prod-fn1.cpc.gov.ae"; //location.hostname; //The name of the HTTP server. For example: "www.dynamsoft.com";
				var strHTTPServer = "cpcdms.ca.ccao.gov.ae";
				var CurrentPathName = unescape(location.pathname);
				var CurrentPath = CurrentPathName.substring(0, CurrentPathName.lastIndexOf("/") + 1);
				var strActionPage = "/CPCScan/Handler"; //CurrentPath + "/CPCScan/Handler";
				DWObject.IfSSL = true; // Set whether SSL is used
				// DWObject.HTTPPort = location.port == "" ? 9080 : location.port;
				var onePage = document.getElementById("OnepagePDF");
				console.log(' onePage :'+onePage);
				console.log(' onePage.checked :'+onePage.checked);

				var Digital = new Date();
				var uploadfilename = Digital.getMilliseconds(); // Uses milliseconds according to local time as the file name
				var documentType = document.getElementById("selectDocTypeList").value;
				var documentName = document.getElementById("documentName").value;
				var multiPage = document.getElementById("MultiPagePDF").checked;


				if (document.getElementById("OnepagePDF").checked == true) {
				 console.log('uploadedFormat ' + uploadedFormat);
				 strActionPage="CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage.checked;;
				 DWObject.HTTPUploadAllThroughPostAsMultiPageTIFF(strHTTPServer, strActionPage, documentName + ".tiff", OnHttpUploadSuccess, OnHttpUploadFailure);
				} else if (document.getElementById("MultiPagePDF").checked == true) {
				 console.log(' MultiPagePDF..');
				 var i = 0;

				 DWObject.ClearAllHTTPFormField();


				 function asyncFailureFunc(errorCode, errorString) {
					 alert("ErrorCode: " + errorCode + "\r" + "ErrorString:" + errorString);
				 }
				 var convertImage = function(_index) {
					 DWObject.ConvertToBlob([_index], EnumDWT_ImageType.IT_TIF,
						 function(result) {
						  var documentType = document.getElementById("selectDocTypeList").value;
						  var documentName = document.getElementById("documentName").value;
							 DWObject.SetHTTPFormField('image_' + _index, result, documentName+'_' + _index+".tiff");
							 i++;

							 if (i < DWObject.HowManyImagesInBuffer) {
								 console.log('1');
								 convertImage(i);
							 } else {
								 console.log('call ser');
							   

								 console.log('documentType :' + documentType);
								
								 
								// var url = "http://vs-cpc-prod-fn1.cpc.gov.ae:9081/CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage.checked;
								 var url = "https://cpcdms.ca.ccao.gov.ae/CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage.checked;
								 DWObject.HTTPUpload(url, OnHttpUploadSuccess, OnHttpUploadFailure);
							 }
						 }, asyncFailureFunc);
					}
					console.log('2');
					convertImage(0);
				}
			}
			//<!--************************************************************************
			 
											//uploadJPG


			//****************************************************************************--> 
			function uploadJPG() {
				console.log(' uploadJPG..');
				console.log('  DWObject.HowManyImagesInBuffer :'+ DWObject.HowManyImagesInBuffer);
				 var onePage = document.getElementById("OnepagePDF");
				 var documentType = document.getElementById("selectDocTypeList").value;
				 var documentName = document.getElementById("documentName").value;
				 
				var i = 0;
				DWObject.ClearAllHTTPFormField();
				DWObject.SetHTTPFormField("UploadedImagesCount", DWObject.HowManyImagesInBuffer);
				 DWObject.IfSSL = true;
				console.log(' 1...');
				function asyncFailureFunc(errorCode, errorString) {
					alert("ErrorCode: " + errorCode + "\r" + "ErrorString:" + errorString);
				}
				console.log(' 2...');
				var convertImage = function (_index) {
					console.log(' 3...');
					DWObject.ConvertToBlob([_index], EnumDWT_ImageType.IT_JPG,
						function (result) {
						console.log('i :'+i);
						console.log(' 4...');
							DWObject.SetHTTPFormField('image_' + _index, result,  documentName+".jpg");
							i++;
							if (i < DWObject.HowManyImagesInBuffer) {
								convertImage(i);
							} else {
								//var strHTTPServer = "cpcdms.ca.ccao.gov.ae";
								   //var url = "http://vs-cpc-prod-fn1.cpc.gov.ae:9081/CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage;
								   var url = "https://cpcdms.ca.ccao.gov.ae/CPCScan/FNUplaodHandler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat+"&pagesNo=" + DWObject.HowManyImagesInBuffer+"&oneFile=" + onePage;
								 //var url = "http://vs-cpc-prod-fn1.cpc.gov.ae:9081/CPCScan/Handler?documentType=" + documentType + "&documentName=" + documentName+"&uploadedFormat=" + uploadedFormat;
								 console.log(' 5...'+url);
								DWObject.HTTPUpload(url, OnHttpUploadSuccess, OnHttpUploadFailure);
							}
						}, asyncFailureFunc);
				}
				convertImage(0);
			}
			//<!--************************************************************************
			 
										//ShowImageEditor


			//****************************************************************************-->
			function ShowImageEditor() {
			 if( DWObject.HowManyImagesInBuffer ==0){
				 alert('الرجاء اضافة ملف');
				 return false;
			 }
			 if (DWObject) {
				 if (DWObject.HowManyImagesInBuffer == 0)
					 alert("عذرا لا يوجد صور مضافه ");
				 else
					 DWObject.ShowImageEditor();
			 }
		 }
			//<!--************************************************************************




			//****************************************************************************-->
			var target = document.getElementById('ddlLanguages');
			target.onmouseover = function() {
			 document.getElementById('tipInfo').style.display = 'block';
			}
			target.onmouseout = function() {
			 document.getElementById('tipInfo').style.display = 'none';
			}
		</script>
		<script src="daynam/Scripts/script.js"></script>
		<script src="daynam/Scripts/jquery.searchabledropdown.js"></script>
		<script>
			$(document).ready(function() {
			$("#selectDocTypeList").searchable({
				//maxListSize: 0,                       // if list size are less than maxListSize, show them all
				maxMultiMatch: 3000,                      // how many matching entries should be displayed
				exactMatch: false,                      // Exact matching on search
				wildcards: true,                        // Support for wildcard characters (*, ?)
				ignoreCase: true,                       // Ignore case sensitivity
				latency: 200,                           // how many millis to wait until starting search
				warnMultiMatch: 'top {0} matches ...',  // string to append to a list of entries cut short by maxMultiMatch
				warnNoMatch: '<fmt:message key="label.noResult" />',          // string to show in the list when no entries match
				zIndex: 'auto' ,                         // zIndex for elements generated by this plugin
					
			});
			//<document.getElementById("numberOfPages").innerHTML = gOptions.maxNumberofPages; 
			fillDocName();
			//Dynamsoft_OnReady();  
		});
		</script>
		<script type="text/javascript">
				var DWObject, deviceList;
				// console.log("Dynamsoft.DWT.ProductKey", Dynamsoft.DWT.ProductKey)
				function Dynamsoft_OnReady() {
					console.log("ScanDocument.jsp:script:function:Dynamsoft_OnReady")
					DWObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer'); 
					// Get the Dynamic Web TWAIN object that is embeded in the div with id 'dwtcontrolContainer'
					if (DWObject) {
						deviceList=[];
						DWObject.GetDevicesAsync().then(function(devices){
							console.log("devices", devices);
							const element = document.getElementById('source');
							console.log("element", element);
							// Get how many sources are installed in the system
							for (var i = 0; i < devices.length; i++) { 
								element.options.add(new Option(devices[i].displayName, i)); 
								// Add the sources in a drop-down list
								deviceList.push(devices[i]);
							}
						}).catch(function (exp) {
							alert(exp.message);
						});
					}
				}
		</script>
	</body>

</html>
