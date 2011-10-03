/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * A row in the query result table.
	 */
	public interface Row : Object {

		/**
		 * Returns an array of all the values in the same order as the column names
		 * returned by QueryResult.get_column_names.
		 *
		 * @return array of values
		 *
		 * @throws RepositoryException if an error occurs
		 */
		public abstract ValueArray get_values (); 

		/**
		 * Returns the value of the indicated column in this Row.
		 *
		 * @param columnName name of query result table column
		 * @return The value of the given column of the current result row.
		 *
		 * @throws ItemNotFoundException if columnName s not among the column names of the query result table.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract Value get_value (string columnName);

		/**
		 * Returns the Node corresponding to this Row and the specified selector, if given.
		 *
		 * @param selectorName The selector identifying a node within the current result row.
		 * @return a {@link Node} instance
		 *
		 * @throws RepositoryException If selectorName is not the alias of a selector in this query or if
		 *                                    another error occurs.
		 */
		public abstract Node get_node (string? selectorName);

		/**
		 * Get the path of a node identified by a selector.
		 *
		 * Equivalent to row.get_node (selectorName).get_path (). However, some
		 * implementations may be able gain efficiency by not resolving the actual Node.
		 *
		 * @param selectorName The selector identifying a node within the current result row.
		 * @return The path representing the node identified by the given selector.
		 *
		 * @throws RepositoryException if selectorName is not the alias of a selector in this query or
		 *                                    if another error occurs.
		 */
		public abstract string get_path (string? selectorName);

		/**
		 * Returns the full text search score for this row associated with the specified
		 * selector.
		 *
		 * This corresponds to the score of a particular node.
		 * If no selectorName is given, the default selector is used.
		 * If no FullTextSearchScore AQM object is associated with the selector
		 * selectorName this method will still return a value. However, in that case
		 * the returned value may not be meaningful or may simply reflect the minimum
		 * possible relevance level (for example, in some systems this might be a s
		 * core of 0).
		 *
		 * Note, in JCR-SQL2 a FullTextSearchScore AQM object is represented by a
		 * SCORE() function. 
		 *
		 * @param selectorName The selector identifying a node within the current result row.
		 * @return float The full text search score for this row.
		 *
		 * @throws RepositoryException if selectorName is not the alias of a selector in this query or
		 *                                    (in case of no given selectorName) if this query has more than one
		 *                                    selector (and therefore, this Row corresponds to more than one Node)
		 *                                    or if another error occurs.
		 */
		public abstract float get_score (string? selectorName);
	}
}
